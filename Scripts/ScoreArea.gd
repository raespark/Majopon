extends Area2D

signal score_up
export (int, "Player1", "Player2") var player
var game_over = false

func _ready():
	self.connect("body_entered", self, "object_entered")

func object_entered(object):
	if object.get_groups().find("Ball") != -1:
		if not game_over:
			emit_signal("score_up", player)
		object.die()

func on_win(player):
	game_over = true
