/// @description Insert description here
audio_play_sound(BGM, 2, true);
if(!audio_is_playing(BGM)){
	alarm_set(0, room_speed * 5);
}
