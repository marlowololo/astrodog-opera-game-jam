/// @description Insert description here
draw_self();

//Flash
if (damagedFeedbackCounter > 0){
	shader_set(shaderFlash);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,
						damagedFeedbackColor, 1);
	shader_reset();
}