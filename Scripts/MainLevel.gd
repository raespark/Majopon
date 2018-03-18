extends Node2D

const main_menu = preload("res://scenes/MainMenu.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to(main_menu)
