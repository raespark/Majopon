extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		print("CANCEL")
		#get_tree().change_scene("res://Scenes/MainMenu.tscn")
