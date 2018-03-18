extends Node2D

signal changeCharacter
signal ready
signal cancel_ready

export (int, "Player1", "Player2") var player
var right_input 
var left_input
var up_input
var down_input
var ready = false
var charIndex
var characters = ['tulip', 'lily', 'rose', 'poppy']

var ready_sound

func _ready():
	ready_sound = get_parent().get_parent().get_node("Ready")
	
	right_input = "ui_right2" if player else "ui_right"
	left_input = "ui_left2" if player else "ui_left"
	up_input = "ui_up2" if player else "ui_up"
	down_input = "ui_down2" if player else "ui_down"
	charIndex = 3 if player else 0

func _physics_process(delta):
	if Input.is_action_just_pressed(left_input) and not ready:
		if charIndex > 0:
			charIndex -=1
		else:
			charIndex = 3
		$Nav.play()
		emit_signal("changeCharacter", characters[charIndex])
	elif Input.is_action_just_pressed(right_input) and not ready:
		if charIndex < 3:
			charIndex += 1
		else: 
			charIndex = 0
		$Nav.play()
		emit_signal("changeCharacter", characters[charIndex])
	elif Input.is_action_just_pressed(up_input) and not ready:
		ready = true
		ready_sound.play()
		emit_signal("ready", player, characters[charIndex])
		get_node("ReadyPlayer").show()
	elif Input.is_action_just_pressed(down_input) and ready:
		ready = false
		emit_signal("cancel_ready", player)
		get_node("ReadyPlayer").hide()
