//jumping
if(isJumping){
	jumpingTimeCounter++;
	var imageIndexBasenOnY = floor(
		jumpingTimeCounter/jumpingDuration * 3
	);
	image_index = imageIndexBasenOnY + 3;
	if(jumpingTimeCounter >= jumpingDuration){
		jumpingTimeCounter = 0;
		ySpeed = -yMaxSpeed;
		isJumping = false;
	}
	return;
}

#region falling
ySpeed = min(ySpeed + yAcceleration, yMaxSpeed);

//animate stuff
var imageIndexBasenOnY = floor(
	(y - minYArr[childIndex])
	/
	(room_height - minYArr[childIndex] -5) * 3 // -5 diujung buat offset aja
); 
if(imageIndexBasenOnY<0) imageIndexBasenOnY = 0;
image_index = imageIndexBasenOnY;

if(x >= room_width){
	x = room_width - (enemySize/2);
	xSpeed = -xBaseSpeed
}

if(x <= 0){
	x = (enemySize/2);
	xSpeed = xBaseSpeed;
}

y += ySpeed;
x += xSpeed;


if(y >= maxY){
	y = maxY;
	isJumping = true;
}

if(damagedFeedbackCounter>0){
	damagedFeedbackCounter--;
}
#endregion