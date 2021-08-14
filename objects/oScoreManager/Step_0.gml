/// @description Insert description here
if(startConvert){
	
	if(convertWaitTimeCounter <= convertWaitTime){
		convertWaitTimeCounter++;
		return;
	}
	
	if(currentWifiCollected>0){
		currentWifiCollected--;
		currentTotalScore += 5;
		convertWaitTimeCounter = 0;
	} else {
		startConvert = false;
		audio_stop_sound(WifiConvert);
		room_goto(MainMenu);
	}
}