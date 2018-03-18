extends Node2D

const main_level = preload("res://scenes/MainLevel.tscn")

var player1Ready
var player1Character
var player2Ready
var player2Character

var timer

func _ready():
	timer = get_node("Timer")
	timer.connect("timeout", self, "change_scenes")

func change_scenes():
	globalVars.player1 = player1Character
	globalVars.player2 = player2Character
	get_tree().change_scene_to(main_level)

func player_ready(player, character):
	print(character)
	if player == 0:
		player1Ready = true
		player1Character = character
	if player == 1:
		player2Ready = true
		player2Character = character
	if player1Ready and player2Ready:
		timer.start()

func player_cancel(player):
	if player == 0:
		player1Ready = false
	if player == 1:
		player2Ready = false