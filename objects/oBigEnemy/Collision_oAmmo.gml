var damageTaken = 0;

with(other){
	damageTaken = damage;
	instance_destroy();
}

hp -= damageTaken;
damagedFeedbackCounter = damagedFeedbackDuration;
if(hp>0){
	return;
}

instance_destroy();
audio_play_sound(BouncyDead, 1, false);

with(oScoreManager){
	AddScore(3 - other.enemyType);
}

if(enemyType < 2){
	with(oCameraShaker){
		ShakeScreen(10, (2-other.enemyType) * 2);
	}
}

if(enemyType < 2){
	var enemy1 = instance_create_layer(x+(enemySize/2),y,layer,oBigEnemy);
	var enemy2 = instance_create_layer(x-(enemySize/2),y,layer,oBigEnemy);
	SetChildAttribute(enemy1);
	SetChildAttribute(enemy2);
	enemy1.xSpeed = xBaseSpeed;
	enemy2.xSpeed = -xBaseSpeed;
} else {
	instance_create_layer(x,y,layer,oWifi);
	with(oSpawnManager){
		EnemyKilled();
	}
}

