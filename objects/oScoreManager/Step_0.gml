/// @description Insert description here
if(startConvert){
	
	if(keyboard_check_pressed(vk_anykey)){
		currentTotalScore += currentWifiCollected * 5;
		currentWifiCollected = 0;
		
		startConvert = false;
		audio_stop_sound(WifiConvert);
		alarm_set(2, room_speed);
	}
	
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
		alarm_set(2, room_speed);
	}
}