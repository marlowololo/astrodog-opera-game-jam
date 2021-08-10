//animation stuff
image_speed = 0;
animationSpeed = 1/3;

//attribute
playerWidth = 64;
xSpeed = 6;

shootCooldown = 0.5 * room_speed;
currentShootTimer = shootCooldown;

//main menu transition
if(global.PlayerXPos != pointer_null){
	x = global.PlayerXPos;
}