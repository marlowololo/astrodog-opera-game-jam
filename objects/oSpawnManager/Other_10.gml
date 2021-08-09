// Start Spawn
for(var i = 0; i < array_length(spawnPosition); i++){
	instance_create_layer(spawnPosition[i].x, spawnPosition[i].y,layer,oBigEnemy);
}
