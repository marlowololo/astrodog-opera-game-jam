//movement

if(keyboard_check(ord("A"))){
	x -= xSpeed;
}

if(keyboard_check(ord("D"))){
	x += xSpeed;
}


//shooting

if(keyboard_check(ord("W")) && currentShootTimer >= shootCooldown){
	instance_create_layer(x,y-5,layer,oAmmo);
	currentShootTimer = 0;
}

currentShootTimer++;