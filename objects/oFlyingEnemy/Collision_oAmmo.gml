var damageTaken = 0;

with(other){
	damageTaken = damage;
	instance_destroy();
}

hp -= damageTaken;
if(hp>0){
	return;
}

instance_destroy();

with(oScoreManager){
	AddScore(5);
}

with(oCameraShaker){
	ShakeScreen(10, 4);
}

with(oSpawnManager){
	EnemyKilled();
}