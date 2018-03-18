extends Node2D

var player1Ready
var player1Character
var player2Ready
var player2Character

var timer

func _ready():
	$Music.play(globalVars.playback_point)
	timer = get_node("Timer")
	timer.connect("timeout", self, "change_scenes")

func change_scenes():
	globalVars.player1 = player1Character
	globalVars.player2 = player2Character
	globalVars.playback_point = $Music.get_playback_position() + 0.1
	get_tree().change_scene("res://Scenes/MainLevel.tscn")

func player_ready(player, character):
	if player == 0:
		player1Ready = true
		player1Character = character
	if player == 1:
		player2Ready = true
		player2Character = character
	if player1Ready and player2Ready:
		timer.start()

func player_cancel(player):
	if not timer.is_stopped():
		timer.stop()
	if player == 0:
		player1Ready = false
	if player == 1:
		player2Ready = false