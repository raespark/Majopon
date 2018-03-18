extends Particles2D

func _physics_process(delta):
	if not is_emitting():
		queue_free()
