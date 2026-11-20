shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float thing = mod(UV.x*5., 2);
	float thing2 = mod(UV.y*5., 2);
	COLOR = vec4(thing*thing2-0.2, thing*thing2-0.2, thing*thing2-0.2, 1.);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
