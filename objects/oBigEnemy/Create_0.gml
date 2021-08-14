//enemy attribute
baseEnemySize = 140;
enemyType = 0;
enemySize = baseEnemySize;
hp = 3;
image_speed = 0;
childIndex = 0;

//speed and dimention related
ySpeed = 0;
yAcceleration = 0.1;
yMaxSpeed = 9;
maxY = room_height-10; //10 jarak kaki player dari batas bawah room

//animation sheet related
minYArr = [];
minYArr[0] = 191;
minYArr[1] = 367;
minYArr[2] = 468;

//jumping related
isJumping = false;
jumpingDuration = 0.25 * room_speed;
jumpingTimeCounter = 0;

//damaged feedback
damagedFeedbackCounter = 0;
damagedFeedbackDuration = 5;
damagedFeedbackColor = c_white;

xBaseSpeed = 3;
xSpeed = xBaseSpeed;

//scaling related
image_xscale = 1;
image_yscale = 1;

#region function
function SetStartingType(_enemyType){
	if(_enemyType==0){
		return;
	}
	enemyType = _enemyType;
	enemySize = baseEnemySize / (2 * _enemyType);
	image_xscale = image_xscale/ (2 * _enemyType);
	image_yscale = image_yscale/ (2 * _enemyType);
	hp = 3 - enemyType;
}

function SetChildAttribute(child){
	child.ySpeed = ySpeed;
	child.yMaxSpeed = yMaxSpeed * 0.75;
	child.enemyType = enemyType + 1;
	child.enemySize = enemySize/2;
	child.image_xscale = image_xscale/2;
	child.image_yscale = image_yscale/2;
	child.hp = 3 - child.enemyType;
	child.childIndex = childIndex+1;
}
#endregion