shader_type spatial;
render_mode skip_vertex_transform;
uniform float speed;
void vertex() {
	float som = clamp(1.0 + VERTEX.x / 500.0, 0.0, 1.0);
	
    VERTEX = (MODELVIEW_MATRIX * vec4(vec3(speed * som,1,1) * VERTEX, 1.0)).xyz;
    NORMAL = normalize((MODELVIEW_MATRIX * vec4(NORMAL, 0.0)).xyz);
	
    // same as above for binormal and tangent, if normal mapping is used
}

void fragment() {
	
  	ALBEDO = vec3(1,1,1);
}