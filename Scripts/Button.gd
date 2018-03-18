extends Button

export (bool) var defualt_button
export (int, "One Player", "Two Player", "How To Play", "Quit") var button_function

var has_selected
var select_sound

func _ready():
	select_sound = get_parent().get_node("Select")
	
	has_selected = false
	
	self.connect("focus_entered", self, "highlighted")
	self.connect("mouse_entered", self, "highlighted")
	self.connect("focus_exited", self, "unhighlighted")
	self.connect("mouse_exited", self, "unhighlighted")
	if defualt_button:
		grab_focus()

func highlighted():
	if not disabled and not has_selected: 
		get_node("Witches").show()

func unhighlighted():
	if not has_selected: 
		get_node("Witches").hide()

func _gui_input(event):
	if event.is_pressed() and not is_disabled() and not has_selected:
		if button_function == 1: #two player
			has_selected = true
			select_sound.play()
			select_sound.connect("finished", self, "character_select")
		if button_function == 2:
			has_selected = true
			select_sound.play()
			select_sound.connect("finished", self, "how_to_play")
		if button_function == 3: #quit
			has_selected = true
			select_sound.play()
			select_sound.connect("finished", self, "quit")

func character_select():
	globalVars.playback_point = get_parent().get_node("Music").get_playback_position() + 0.1
	get_tree().change_scene("res://Scenes/CharacterSelect.tscn")

func how_to_play():
	globalVars.playback_point = get_parent().get_node("Music").get_playback_position() + 0.1
	get_tree().change_scene("res://Scenes/HowToPlay.tscn")

func quit():
	get_tree().quit()	