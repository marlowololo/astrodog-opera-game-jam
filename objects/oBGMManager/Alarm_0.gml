/// @description Insert description here
if(!audio_is_playing(BGM)){
	audio_play_sound(BGM, 2, true);
	alarm_set(0, room_speed * 5);
}
