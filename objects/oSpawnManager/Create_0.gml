//hardcoded setting for onboarding
spawnSetting = [];
waveSetting = [];
spawnSetting[0] = [1];
spawnSetting[1] = [1,1];
spawnSetting[2] = [0];
spawnSetting[3] = [0,0];
waveSetting[0] = [1];
waveSetting[1] = [2];
waveSetting[2] = [1];
waveSetting[3] = [2];

spawnSetting[4] = [3];
spawnSetting[5] = [3,3];
spawnSetting[6] = [1,1,3,3];
spawnSetting[7] = [3,3,0,0];
waveSetting[4] = [1];
waveSetting[5] = [2];
waveSetting[6] = [2,2];
waveSetting[7] = [2,2];

spawnSetting[8] = [3,3,3];
spawnSetting[9] = [1,1,1];
spawnSetting[10] = [3,0,0,3];
spawnSetting[11] = [0,3,3,0];
waveSetting[8] = [3];
waveSetting[9] = [3];
waveSetting[10] = [2,2];
waveSetting[11] = [2,2];

currentWave = 0;
endOfCustomizedLevel = 12;

#region function

function StartSpawn(){
	show_debug_message("LEVEL " + string(global.Level));
	// Start Spawn
	currentWave = 0;
	randomize();
	SpawnWave();
}

function SpawnWave(){
	randomise();
	if(global.Level >= endOfCustomizedLevel){
		var waveEnemyCount = 3;
	} else {
		var waveEnemyCount = waveSetting[global.Level][currentWave];
	}
	var xSpawnOffset = room_width / (waveEnemyCount + 1);
	for(var i = 0;i<waveEnemyCount;i++){
		
		if(global.Level >= endOfCustomizedLevel){
			var rand = irandom(1);
			if(rand == 0){
				var spawnEnemyType = 0;
			} else {
				var spawnEnemyType = 3;
			}
		} else {
			var spawnEnemyType = spawnSetting[global.Level][0];
		}
		
		var enemy = 0;
		if( spawnEnemyType <3 ){
			enemy = instance_create_layer(xSpawnOffset * (i + 1), 160, layer, oBigEnemy);
			enemy.SetStartingType(spawnEnemyType);
			var rand = irandom(1);
			if(rand == 1){
				enemy.xSpeed = -3;
			} else {
				enemy.xSpeed = 3;
			}
		} else {
			enemy = instance_create_layer(xSpawnOffset * (i + 1), 160, layer, oFlyingEnemy);
			var rand = irandom(1);
			var randSpeed = random_range(1.5,3)
			if(rand == 1){
				enemy.xSpeed = -randSpeed;
			} else {
				enemy.xSpeed = randSpeed;
			}
			var randAttackCooldown = random_range(room_speed * 2, room_speed * 3);
			enemy.attackCooldown = randAttackCooldown;
		}
		

	}
	
	currentWave++;
	
	if(global.Level >= endOfCustomizedLevel){
		var waveCount = 3; // diganti jadi berdasarkan berapa kali loop boss udah kelewat * some value
	} else {
		var waveCount = array_length(waveSetting[global.Level]);
	}
	
	if (currentWave < waveCount) {
		alarm_set(1, 5*room_speed);
	}
}

function EnemyKilled(){
	if(global.Level >= endOfCustomizedLevel){
		if (currentWave < 3){ // diganti jadi berdasarkan berapa kali loop boss udah kelewat * some value
			return;
		}
	} else {
		if (currentWave < array_length(waveSetting[global.Level])-1) {
			return;
		}
	}
	
	
	var enemyLeft = instance_number(oBigEnemy);
	enemyLeft += instance_number(oFlyingEnemy);
	
	//all wave cleared
	if(enemyLeft <= 0){
		global.Level++;
		global.IsOnUpgradeDelay = true;
		instance_create_layer(448,95, "Manager", oUpgradeManager);
	}
}

#endregion

//initial create, when opening the room
alarm_set(0, 1*room_speed);