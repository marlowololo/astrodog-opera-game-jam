shaking = false;
shakeForce = 0;

xBasePosition = camera_get_view_x(view_camera[0]);
yBasePosition = camera_get_view_y(view_camera[0]);

function ShakeScreen(_duration, _shakeForce){
	show_debug_message("SHAKE!");
	shakeForce = _shakeForce;
	shaking = true;
	alarm_set(0, _duration);
}