extends Label

export (int, "Player1", "Player2") var player
var score

func _ready():
	score = 0

func score_change(playerScore):
	print(playerScore)
	print(player)
	if(player == playerScore):
		print("MATCH")
		score += 1
		set_text(str(score))