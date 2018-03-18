extends Node2D

var timer

func _ready():
	timer = get_node("Timer")
	timer.connect("timeout", self, "restart")

func restart():
	globalVars.playback_point = get_parent().get_parent().get_node("Music").get_playback_position() + 0.1
	get_tree().reload_current_scene()

func win(player):
	var banner = get_node("banner")
	var winMessage = get_node("player2") if player else get_node("player1")
	banner.show()
	winMessage.show()
	$Win.play()
	timer.start()

