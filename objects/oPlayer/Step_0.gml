//movement

if(keyboard_check(ord("A"))){
	x -= xSpeed;
	image_xscale = -1;
	image_speed = animationSpeed;
}

if(keyboard_check(ord("D"))){
	x += xSpeed;
	image_xscale = 1;
	image_speed = animationSpeed;
}

if(
	keyboard_check_released(ord("A"))
	|| keyboard_check_released(ord("D"))
){
	image_speed = 0;
	image_index = 0;
}

if(x <= playerWidth/2){
	x = playerWidth/2;
}

if(x >= room_width - (playerWidth/2)){
	x = room_width - (playerWidth/2);
}


//shooting
if(keyboard_check(ord("W")) && currentShootTimer >= shootCooldown){
	instance_create_layer(x,y-5,layer,oAmmo);
	currentShootTimer = 0;
}

currentShootTimer++;