//animation stuff
image_speed = 0;
animationSpeed = 1/3;

//attribute
playerWidth = 64;
xSpeed = 6;

shootCooldown = 0.5 * room_speed - 27;
currentShootTimer = shootCooldown;

//upgradeStuff
fireRateLevel = 0;

//main menu transition
if(global.PlayerXPos != pointer_null){
	x = global.PlayerXPos;
}

#region function

function UpgradeFireRate(){
	var base = 1.5;
	fireRateLevel++;
	shootCooldown -= base / (fireRateLevel*0.25);
}

#endregion