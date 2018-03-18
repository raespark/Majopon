extends Node2D

func _ready():
	$Music.play(globalVars.playback_point)

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		globalVars.playback_point = $Music.get_playback_position()
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
