function CheckHighScore(newScore){
	if(newScore>global.HighScore){
		global.HighScore = newScore;
	}
}

centerPos = room_width/2;