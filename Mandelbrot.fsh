void main() {
	//vec2 offset = vec2(-0.225,0.7);
	//float zoom = 0.005;
	
	//vec2 offset = vec2(-1.41,0.0);
	//float zoom = 0.019999;
	
	vec2 offset = vec2(-0.417,0.6029);
	float zoom = 0.01;
	
	//vec2 offset = vec2(-0.5,0.6);
	//float zoom = 3;
	
	vec2 pixelScale = vec2(1.0, u_resolution.y / u_resolution.x);
    vec2 uv = (v_tex_coord - 0.5) * pixelScale;
	
    vec2 c = uv * zoom + offset ;
    vec2 z = vec2(0.0, 0.0);
    int maxIterations = 600;
    int i;
    for (i = 0; i < maxIterations; i++) {
        if (dot(z, z) > 10.0) {
        	
        	break;
        }
        z = vec2(
            z.x * z.x - z.y * z.y + c.x,
            2.0 * z.x * z.y + c.y
        );
    }
    
    float cd = float(i) / float(maxIterations);
    float x = sin(cd*u_time*100);
    float g = tan(cd*u_time*10);
    
    gl_FragColor = vec4(cd+g/50, cd-g/110, x, 1.0);
}