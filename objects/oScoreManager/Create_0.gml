//config
centerPos = room_width/2;

//attribute
currentTotalScore = 0;
currentWifiCollected = 0;

//convert
startConvert = false;
convertWaitTime = 0.1 * room_speed;
convertWaitTimeCounter = 0;

#region function

function AddScore(_scoreAdd){
	//handle juga player disini kalo nanti mau jadi bisa multiplayer
	currentTotalScore += _scoreAdd;
}

function AddWifi(_wifi){
	currentWifiCollected += _wifi;
}

function OnLose(){
	alarm_set(0, room_speed);
	if(currentWifiCollected>0){
		alarm_set(1, room_speed);
	}
}

#endregion