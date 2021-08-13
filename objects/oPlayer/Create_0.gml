//attribute
playerWidth = 64;
xSpeed = 6;

shootCooldown = 0.3 * room_speed;
currentShootTimer = shootCooldown;

//upgradeStuff
fireRateLevel = 0;
damageLevel = 0;

shootDamage = 1;

//animation stuff
image_speed = 0;
runningAnimationSpeed = 1/3;
shootingAnimationSpeed = 2/3;
shootingAnimationLength = 9; //intinya biar bisa 9 frame
shootingAnimationCounter = 0;
isShooting = false;

//main menu transition
if(global.PlayerXPos != pointer_null){
	x = global.PlayerXPos;
}

#region function

function UpgradeFireRate(){
	var upgradeSpeed = 0;
	fireRateLevel++;
	//hardcoded, but wtf i have no time
	if(fireRateLevel <= 2){
		upgradeSpeed = 4;
	} else if(fireRateLevel <= 4){
		upgradeSpeed = 1.5;
	} else {
		upgradeSpeed = 1;
	}

	shootCooldown -= upgradeSpeed;
	if(shootCooldown < shootingAnimationLength){
		shootingAnimationLength = shootCooldown;
		shootingAnimationSpeed = 2/3 * (shootingAnimationLength/9);
	}
}

function UpgradeDamage(){
	damageLevel++;
	if(damageLevel <= 2){
		shootDamage += 1.5;
	} else if (damageLevel <= 4){
		shootDamage += 1;
	} else {
		shootDamage += 0.5;
	}
}

function UpgradeMoveSpeed(){
	xSpeed++;
}

#endregion