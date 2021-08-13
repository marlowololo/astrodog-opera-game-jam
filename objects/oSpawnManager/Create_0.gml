//hardcoded setting for onboarding
spawnSetting = [];
spawnSetting[0] = [1];
spawnSetting[1] = [1,1];
spawnSetting[2] = [0];
spawnSetting[3] = [0,0];
spawnSetting[4] = [1,1,0];
spawnSetting[5] = [1,0,0,1];
spawnSetting[6] = [0,1,0,0,1,0];
spawnSetting[7] = [1,0,1,1,0,1];

waveSetting = [];
waveSetting[0] = [1];
waveSetting[1] = [2];
waveSetting[2] = [1];
waveSetting[3] = [2];
waveSetting[4] = [2,1];
waveSetting[5] = [2,2];
waveSetting[6] = [3,3];
waveSetting[7] = [3,3];

currentWave = 0;
endOfCustomizedLevel = 8;

#region function

function StartSpawn(){
	show_debug_message("LEVEL " + string(global.Level));
	// Start Spawn
	currentWave = 0;
	randomize();
	SpawnWave();
}

function SpawnWave(){
	if(global.Level >= endOfCustomizedLevel){
		var waveEnemyCount = 3;
	} else {
		var waveEnemyCount = waveSetting[global.Level][currentWave];
	}
	var xSpawnOffset = room_width / (waveEnemyCount + 1);
	for(var i = 0;i<waveEnemyCount;i++){
		var enemy = instance_create_layer(xSpawnOffset * (i + 1), 160, layer, oBigEnemy);
		
		if(global.Level >= endOfCustomizedLevel){
			enemy.SetStartingType(0); // or random antara big or flying
		} else {
			enemy.SetStartingType(spawnSetting[global.Level][0]);
			array_delete(spawnSetting[global.Level], 0, 1);
		}
		
		var rand = irandom(1);
		if(rand == 1){
			enemy.xSpeed = -3;
		} else {
			enemy.xSpeed = 3;
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
	
	//all wave cleared
	if(enemyLeft <= 0){
		global.Level++;
		//temp upgrade player firerate langsung
		//harusnya munculin pilihan upgrade
		with(oPlayer){
			UpgradeFireRate();
		}
		
		alarm_set(0,1 * room_speed);
	}
}

#endregion

//initial create, when opening the room
alarm_set(0, 1*room_speed);