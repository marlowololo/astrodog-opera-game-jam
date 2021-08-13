upgradeArr = [];
upgradeArr[0] = oUpgrade_Damage;
upgradeArr[1] = oUpgrade_FireRate;
upgradeArr[2] = oUpgrade_MoveSpeed;

function OpenUpgrade(){
	with(oAmmo){
		instance_destroy();
	}
	global.IsOnUpgradeDelay = true;
	
	alarm_set(0, room_speed * 1.5);
	
	var updateTypeCount = array_length(upgradeArr);
	var xOffset = room_width/(updateTypeCount + 1);
	var yOffset = 50;
	for(var i = 0; i < updateTypeCount; i++){
		instance_create_layer(xOffset * (i + 1), y + yOffset, layer, upgradeArr[i]);
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
}

OpenUpgrade();
image_xscale = 8;