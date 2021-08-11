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
	//animation stuff
	if(!isShooting){
		sprite_index = spriteAstrodogShootingUp;
		image_index = 0;
	}
	isShooting = true;
}

if(isShooting){
	//animation shooting image speed
	image_speed = 1;// 2 * image number, karena sprite 30 fps
	
	shootingAnimationCounter++;
	if(shootingAnimationCounter>shootingAnimationLength){
		sprite_index = spriteAstrodogRunning
		image_speed = 0;
		isShooting = false;
		shootingAnimationCounter = 0;
		
		//shooting logic
		instance_create_layer(x,y-20,layer,oAmmo);
		currentShootTimer = 0;
	}
}

currentShootTimer++;