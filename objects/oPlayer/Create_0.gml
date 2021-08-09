playerWidth = 64;
xSpeed = 6;

shootCooldown = 0.5 * room_speed;
currentShootTimer = shootCooldown;
if(global.PlayerXPos != pointer_null){
	x = global.PlayerXPos;
}