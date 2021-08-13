if(currentAttackTimer <= attackTime){
	var ammo1 = instance_create_layer(x,y,layer,oFlyingEnemyAmmo);
	var ammo2 = instance_create_layer(x,y,layer,oFlyingEnemyAmmo);
	ammo1.direction -= 15;
	ammo1.image_angle -= 15;
	ammo2.direction += 15;
	ammo1.image_angle += 15;
	alarm_set(0, attackTimeSpace);
} else {
	isAttacking = false;
	currentAttackTimer = 0;
	currentAttackCooldownTimer = 0;
	image_blend = c_white;
}