if(!audio_is_playing(BGM)){
	audio_sound_gain(BGM, 0.33, 0);
	audio_play_sound(BGM, 2, true);
}