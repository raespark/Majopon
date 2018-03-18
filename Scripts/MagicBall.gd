extends RigidBody2D

export (PackedScene) var death_animation

func die(): 
	var magic_death = death_animation.instance()
	get_parent().add_child(magic_death)
	magic_death.set_position(get_global_position())
	magic_death.get_node("Particles").set_one_shot(true)
	queue_free()

func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "die")

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	var player_group = get_groups().find("Player_1") #returns a positive number if player1, -1 if player2
	for body in bodies:
		var body_groups = body.get_groups()
		if body_groups.find("Ball") != -1 and not body_groups.find("Player_1") == player_group:
			body.die()
			die()
			return