//hardcoded setting for onboarding
waveSetting = [];
waveSetting[0] = [1];
waveSetting[1] = [1,1];
waveSetting[2] = [1,1,1];
waveSetting[3] = [0];
waveSetting[4] = [0,1];
waveSetting[5] = [0,1,1];
waveSetting[6] = [0];
waveSetting[7] = [0,0];
waveSetting[8] = [0,0,0];

#region function
function SpawnPosition(_x, _y) constructor
{
	x = _x;
	y = _y;
}

spawnPosition = [];

function StartSpawn(){
	// Start Spawn
	randomize();
	for(var i = 0; i < array_length(spawnPosition); i++){
		var enemy = instance_create_layer(spawnPosition[i].x, spawnPosition[i].y,layer,oBigEnemy);
		
		if(global.Wave<9){
			enemy.SetStartingType( waveSetting[global.Wave][i] );
		}
		
		var rand = irandom(1);
		if(rand == 1){
			enemy.xSpeed = -3;
		} else {
			enemy.xSpeed = 3;
		}
	}
}

function EnemyKilled(){
	var numOfEnemy = instance_number(oBigEnemy);
	if(numOfEnemy <= 0){
		global.Wave++;
		SetSpawnPosition();
		
		//temp upgrade player firerate
		with(oPlayer){
			UpgradeFireRate();
		}
		
		alarm_set(0,1 * room_speed);
	}
}

function SetSpawnPosition(){
	var spawnHeight = 160;
	delete spawnPosition;
	spawnPosition = [];
	numberOfSpawnPerGroup = global.Wave % 3;
	switch(numberOfSpawnPerGroup){
		case 0:
		spawnPosition[0] = new SpawnPosition(450, spawnHeight);
		break;
		case 1:
		spawnPosition[0] = new SpawnPosition(300, spawnHeight);
		spawnPosition[1] = new SpawnPosition(600, spawnHeight);
		break;
		case 2:
		spawnPosition[0] = new SpawnPosition(225, spawnHeight);
		spawnPosition[1] = new SpawnPosition(450, spawnHeight);
		spawnPosition[2] = new SpawnPosition(675, spawnHeight);
		break;
	}
}
#endregion

//initial create, when opening the room
SetSpawnPosition();
alarm_set(0, 1*room_speed);