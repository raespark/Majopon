extends Button


func _gui_input(event):
	if event.is_pressed() and not is_disabled():
			get_tree().change_scene("res://scenes/MainMenu.tscn")
