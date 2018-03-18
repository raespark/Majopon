extends Button

const main_menu = preload("res://scenes/MainMenu.tscn")

func _gui_input(event):
	if event.is_pressed() and not is_disabled():
			get_tree().change_scene_to(main_menu)
