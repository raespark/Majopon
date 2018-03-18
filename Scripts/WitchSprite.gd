extends Node2D

export (int, "Player1", "Player2") var player

func _ready():
	if player == 0:
		tulip()
	if player == 1:
		poppy()

func pick_character(character_name):
	if character_name == "tulip":
		tulip()
	elif character_name == "rose":
		rose()
	elif character_name == "lily":
		lily()
	elif character_name == "poppy":
		poppy()

func clear():
	get_node("Base/Hat/squishHat").hide()
	get_node("Base/head/hair1Back").hide()
	get_node("Base/head/HairFront/Hair1Front").hide()
	get_node("Base/head/blush").hide()
	get_node("Base/CoatShape/star").hide()
	get_node("Base/Hat/pointHat").hide()
	get_node("Base/head/HairFront/Hair2Front").hide()
	get_node("Base/head/freckles").hide()
	get_node("Base/CoatShape/lightning").hide()
	get_node("Base/Hat/swirlHat").hide()
	get_node("Base/head/Hair3Back").hide()
	get_node("Base/head/HairFront/Hair3Front").hide()
	get_node("Base/head/glasses").hide()
	get_node("Base/CoatShape/heart").hide()
	get_node("Base/head/HairFront/hair4Front").hide()
	get_node("Base/head/Hair4Back").hide()

func tulip():
	clear()
	get_node("Base/Hat/squishHat").show()
	get_node("Base/head/hair1Back").show()
	get_node("Base/head/HairFront/Hair1Front").show()
	get_node("Base/head/blush").show()
	get_node("Base/CoatShape/star").show()

func rose():
	clear()
	get_node("Base/Hat/pointHat").show()
	get_node("Base/head/HairFront/Hair2Front").show()
	get_node("Base/head/freckles").show()
	get_node("Base/CoatShape/lightning").show()

func lily():
	clear()
	get_node("Base/Hat/swirlHat").show()
	get_node("Base/head/Hair3Back").show()
	get_node("Base/head/HairFront/Hair3Front").show()
	get_node("Base/head/glasses").show()
	get_node("Base/CoatShape/heart").show()

func poppy():
	clear()
	get_node("Base/Hat/squishHat").show()
	get_node("Base/head/HairFront/hair4Front").show()
	get_node("Base/head/Hair4Back").show()
	get_node("Base/head/blush").show()
	get_node("Base/CoatShape/heart").show()