offsetY = 0;
currentDegOffset = 0;
baseYPos = y;

xBaseSpeed = 2;
xSpeed = xBaseSpeed;

hp = 6;

//attack
attackCooldown = room_speed * 3;
currentAttackCooldownTimer = 0;
isAttacking = false;

attackTime = room_speed * 2;
attackTimeSpace = attackTime / 2; // 3 times attack
currentAttackTimer = 0;

//damaged feedback
damagedFeedbackCounter = 0;
damagedFeedbackDuration = 5;
damagedFeedbackColor = c_white;
