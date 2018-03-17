extends Label

export (int, "Player1", "Player2") var player
const winLimit = 15
signal win
var score

func _ready():
	score = 0

func score_change(playerScore):
	if(player == playerScore):
		score += 1
		set_text(str(score))
		if score >= winLimit:
			emit_signal("win", player)