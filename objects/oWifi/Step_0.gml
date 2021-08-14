/// @description Insert description here

if(y >= room_height - 10){
	y = room_height - 10
	dissapearCounter++;
	if(dissapearCounter > dissapearLimit){
		instance_destroy();
	}
	return;
}

y += 5;