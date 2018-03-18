extends Node2D

var timer

func _ready():
	timer = get_node("Timer")
	timer.connect("timeout", self, "restart")

func restart():
	get_tree().reload_current_scene()

func win(player):
	var banner = get_node("banner")
	var winMessage = get_node("player2") if player else get_node("player1")
	banner.show()
	winMessage.show()
	timer.start()

