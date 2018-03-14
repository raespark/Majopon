extends Label

export (int, "Player1", "Player2") var player
var score

func _ready():
	score = 0

func score_change(playerScore):
	if(player == playerScore):
		score += 1
		set_text(str(score))