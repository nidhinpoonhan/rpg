shader_type canvas_item;

uniform bool active = true;

void fragment() {
	vec4 previous_colour = texture(TEXTURE, UV);
	vec4 white_colour = vec4(1.0, 1,0, 1.0, previous_colour.a);
	vec4 new_color = previous_colour;
	if (active == true) {
		new_color = white_colour;
	}
	COLOR = new_color;
}