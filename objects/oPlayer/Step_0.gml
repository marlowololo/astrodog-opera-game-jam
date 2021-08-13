//movement

if(keyboard_check(ord("A"))){
	if(!isShooting){
		sprite_index = spriteAstrodogRunning;
	}
	x -= xSpeed;
	image_xscale = -1;
	image_speed = runningAnimationSpeed;
}

if(keyboard_check(ord("D"))){
	if(!isShooting){
		sprite_index = spriteAstrodogRunning;
	}
	x += xSpeed;
	image_xscale = 1;
	image_speed = runningAnimationSpeed;
}

if(
	keyboard_check_released(ord("A"))
	|| keyboard_check_released(ord("D"))
){
	if(!isShooting){
		sprite_index = spriteAstrodogIdle;
		image_speed = 0;
		image_index = 0;
	}
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
	image_speed = shootingAnimationSpeed;
	
	shootingAnimationCounter++;
	if(shootingAnimationCounter>shootingAnimationLength){
		if(shootingAnimationLength>=9){
			sprite_index = spriteAstrodogIdle;
			image_speed = 0;
		}

		isShooting = false;
		shootingAnimationCounter = 0;
		
		//shooting logic
		instance_create_layer(x,y-20,layer,oAmmo);
		currentShootTimer = 0;
	}
}

currentShootTimer++;