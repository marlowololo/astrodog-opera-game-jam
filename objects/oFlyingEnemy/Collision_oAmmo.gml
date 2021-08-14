var damageTaken = 0;

with(other){
	damageTaken = damage;
	instance_destroy();
}

damagedFeedbackCounter = damagedFeedbackDuration;
hp -= damageTaken;
if(hp>0){
	return;
}

instance_destroy();
audio_play_sound(FlyingDead, 1, false);

with(oScoreManager){
	AddScore(5);
}

with(oCameraShaker){
	ShakeScreen(10, 4);
}

with(oSpawnManager){
	EnemyKilled();
}