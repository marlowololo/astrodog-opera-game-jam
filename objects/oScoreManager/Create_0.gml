//config
centerPos = room_width/2;

//attribute
currentTotalScore = 0;

#region function

function AddScore(_scoreAdd){
	//handle juga player disini kalo nanti mau jadi bisa multiplayer
	currentTotalScore += _scoreAdd;
}

function OnLose(){
	with(oHighScoreManager){
		CheckHighScore(other.currentTotalScore);
	}
	ResetWaveSetting();
}

#endregion