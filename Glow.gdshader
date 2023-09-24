shader_type spatial;
render_mode skip_vertex_transform;
uniform float speed;
uniform vec3 colorseed;
void vertex() {
	float som = clamp(1.0 + VERTEX.x / 500.0, 0.0, 1.0);
	
	float scal = 1.0;
	if (speed > 300000.0) {
		scal = scal * 6.0;
		}
	
    VERTEX = (MODELVIEW_MATRIX * vec4(VERTEX * vec3(speed * som,scal,scal), 1.0)).xyz;
    NORMAL = normalize((MODELVIEW_MATRIX * vec4(NORMAL, 0.0)).xyz);
	
    // same as above for binormal and tangent, if normal mapping is used
}

void fragment() {
  	ALBEDO = colorseed;
}