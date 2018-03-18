extends Button

export (bool) var defualt_button
export (int, "One Player", "Two Player", "How To Play", "Quit") var button_function

func _ready():
	self.connect("focus_entered", self, "highlighted")
	self.connect("mouse_entered", self, "highlighted")
	self.connect("focus_exited", self, "unhighlighted")
	self.connect("mouse_exited", self, "unhighlighted")
	if defualt_button:
		grab_focus()

func highlighted():
	get_node("Witches").show()

func unhighlighted():
	get_node("Witches").hide()

func _gui_input(event):
	if event.is_pressed() and not is_disabled():
		if button_function == 1: #two player
			get_tree().change_scene("res://Scenes/CharacterSelect.tscn")
		if button_function == 3: #quit
			get_tree().quit()