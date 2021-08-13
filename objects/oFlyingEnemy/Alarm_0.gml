if(currentAttackTimer <= attackTime){
	var ammo1 = instance_create_layer(x,y,layer,oFlyingEnemyAmmo);
	//var ammo2 = instance_create_layer(x,y,layer,oFlyingEnemyAmmo);
	var angle = 0;
	with(oPlayer){
		angle = point_direction(other.x, other.y, x, y);
	}
	
	ammo1.direction = angle;
	ammo1.image_angle = angle - 270; //-270 karena sprite ngadep bawah
	alarm_set(0, attackTimeSpace);
	
} else {
	isAttacking = false;
	currentAttackTimer = 0;
	currentAttackCooldownTimer = 0;
	image_blend = c_white;
}