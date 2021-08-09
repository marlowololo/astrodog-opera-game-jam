with(other){
	instance_destroy();
}

instance_destroy();

if(enemyType < 2){
	var enemy1 = instance_create_layer(x+(enemySize/2),y,layer,oBigEnemy);
	var enemy2 = instance_create_layer(x-(enemySize/2),y,layer,oBigEnemy);
	SetChildAttribute(enemy1);
	SetChildAttribute(enemy2);
	enemy1.xSpeed = 3;
	enemy2.xSpeed = -3;
} else {
	with(oSpawnManager){
		EnemyKilled();
	}
}

