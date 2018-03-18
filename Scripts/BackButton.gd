extends Button

func _gui_input(event):
	if event.is_pressed() and not is_disabled():
			globalVars.playback_point = get_parent().get_parent().get_node("Music").get_playback_position() + 0.1 #delay for load
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
