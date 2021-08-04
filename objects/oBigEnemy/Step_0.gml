ySpeed = min(ySpeed + yAcceleration, yMaxSpeed);

if(y+ySpeed >= maxY){
	y = maxY;
	ySpeed = -yMaxSpeed;
}

y += ySpeed;
x += xSpeed;