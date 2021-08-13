upgradeArr = [];
upgradeArr[0] = oUpgrade_Damage;
upgradeArr[1] = oUpgrade_FireRate;
upgradeArr[2] = oUpgrade_MoveSpeed;

function OpenUpgrade(){
	alarm_set(0, room_speed * 1.5);
	
	var updateTypeCount = array_length(upgradeArr);
	var xOffset = room_width/(updateTypeCount + 1);
	var yOffset = 50;
	for(var i = 0; i < updateTypeCount; i++){
		instance_create_layer(xOffset * (i + 1), y + yOffset, layer, upgradeArr[i]);
	}
	
	global.IsOnUpgradeDelay = true;
	
	with(oAmmo){
		instance_destroy();
	}
	with(oFlyingEnemyAmmo){
		instance_destroy();
	}
}

function FireRateUpgrade(){
	with(oPlayer){
		UpgradeFireRate();
	}
	AfterUpgrade()
}

function DamageUpgrade(){
	with(oPlayer){
		UpgradeDamage();
	}
	AfterUpgrade()
}

function MoveSpeedUpgrade(){
	with(oPlayer){
		UpgradeMoveSpeed();
	}
	AfterUpgrade()
}

function AfterUpgrade(){
	for(var i = 0; i < array_length(upgradeArr);i++){
		with(upgradeArr[i]){
			instance_destroy();
		}
	}
	
	with(oSpawnManager){
		alarm_set(0, room_speed);
	}
	instance_destroy();
	global.IsOnUpgradeDelay = false;
}

global.IsOnUpgradeDelay = true;
with(oAmmo){
	instance_destroy();
}
with(oFlyingEnemyAmmo){
	instance_destroy();
}

alarm_set(1, room_speed * 0.5);
image_xscale = 8;