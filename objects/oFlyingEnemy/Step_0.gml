offsetY = 50 * sin(currentDegOffset);
currentDegOffset += 0.05;

y = baseYPos + offsetY;

if(!isAttacking){
	x += xSpeed;
	currentAttackCooldownTimer++;
}

if(isAttacking){
	currentAttackTimer++;
}

if(currentAttackCooldownTimer >= attackCooldown && !isAttacking){
	isAttacking = true;
	image_blend = c_red;
	alarm_set(0,1);
}
