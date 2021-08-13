if(shaking){
	camera_set_view_pos(
		view_camera[0],
		xBasePosition + random_range(-shakeForce, shakeForce),
		yBasePosition + random_range(-shakeForce, shakeForce)
	);
}