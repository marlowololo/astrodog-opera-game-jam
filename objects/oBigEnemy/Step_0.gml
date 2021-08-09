ySpeed = min(ySpeed + yAcceleration, yMaxSpeed);

if(y+ySpeed >= maxY){
	y = maxY;
	ySpeed = -yMaxSpeed;
}

if(x >= room_width){
	x = room_width - (enemySize/2);
	xSpeed = -3
}

if(x <= 0){
	x = (enemySize/2);
	xSpeed = 3;
}

y += ySpeed;
x += xSpeed;

