//movement

if(keyboard_check(ord("A"))){
	x -= xSpeed;
}

if(keyboard_check(ord("D"))){
	x += xSpeed;
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