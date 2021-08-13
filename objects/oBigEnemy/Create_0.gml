//enemy attribute
enemyType = 0;
enemySize = 128;
hp = 3;

//speed and dimention related
ySpeed = 0;
yAcceleration = 0.1;
yMaxSpeed = 9;
maxY = room_height-(enemySize/2);//768 batas bawah screen

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
	enemySize = enemySize / (2 * _enemyType);
	image_xscale = image_xscale/ (2 * _enemyType);
	image_yscale = image_yscale/ (2 * _enemyType);
	maxY = room_height-enemySize/2;
	hp = 3 - enemyType;
}

function SetChildAttribute(child){
	child.ySpeed = ySpeed;
	child.yMaxSpeed = yMaxSpeed * 0.75;
	child.maxY = maxY+(enemySize/4);
	child.enemyType = enemyType + 1;
	child.enemySize = enemySize/2;
	child.image_xscale = image_xscale/2;
	child.image_yscale = image_yscale/2;
	child.hp = 3 - child.enemyType;
}
#endregion