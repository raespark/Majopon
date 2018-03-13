extends RigidBody2D

func die(): 
	queue_free()

func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "die")
