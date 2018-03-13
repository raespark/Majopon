extends Node2D

export (PackedScene) var magic_object #the scene/object the magicBall should look like
export (Color) var magic_color #color this Player's magicBall should be
var velocity = Vector2()  # the player's movement vector
var screensize  # size of the game window
var animationPlayer #plays character animations
var timer #cooldown timer

func _ready():
	#grab the size of the screen
	screensize = get_viewport_rect().size
	#get the characters animationPlayer to set animations
	animationPlayer = get_node("Sprite").get_node("Animation")
	#get the characters cooldown timer
	timer = get_node("Timer")
	#set up a listener for when animations finish to call the corresponding method
	animationPlayer.connect("animation_finished", self, "animation_finished", [self])

func animation_finished(animation, node):
	if animation == "Attack":
		#create an instance of the magicBall object
		var magic = magic_object.instance()
		
		#add the object to the scene
		get_parent().add_child(magic)
		
		#set thhe color of the magicBall to the color set in the inspector for this player
		magic.set_modulate(magic_color)
		#set a random angle for the magic to shoot out at (up or down)
		var y_angle = rand_range(-300, 300)
		#shoot the magic
		magic.set_linear_velocity(Vector2(-300, y_angle))
		
		#indicate that this magic was shot by player1
		magic.add_to_group("Player_2")
		magic.add_to_group("Ball")
		
		#spawn the magic at the end of the players wand
		magic.set_position(get_node("MagicSpawnPoint").get_global_position())

func _physics_process(delta):
	velocity = Vector2()
	
	var direction = "" #track which direction the user is pressing to play corresponding animation
	if Input.is_action_pressed("ui_down2") and not animationPlayer.current_animation == "Attack":
		#add to the characters velocity, to move them down
		velocity.y += 1
		direction = "Down"
	elif Input.is_action_pressed("ui_up2") and not animationPlayer.current_animation == "Attack":
		#subtract from the characters velocity, to move them up
		velocity.y -= 1
		direction = "Up"
	if velocity.length() > 0:
		#play the animation in the direction of the characters movement with a .075 second transition
		animationPlayer.play(direction, .075)
		#move the character
		velocity = velocity.normalized() * 300 #300 is the speed at which the character moves
	#if the cooldown is up, and the animation isn't currently playing, attack
	elif Input.is_action_pressed("ui_left2") and timer.is_stopped():
		if not (animationPlayer.current_animation == "Attack"):
			#start the cooldown timer
			timer.start()
			#play attack animation
			animationPlayer.play("Attack", .01, 2)
	#if nothing else is happening, play the idle animation
	elif not (animationPlayer.current_animation == "Idle") and not (animationPlayer.current_animation == "Attack"):
		animationPlayer.play("Idle", .1)
	
	#move the character using the velocity calculated
	position += velocity * delta
	#don't let the character go off screen
	position.y = clamp(position.y, 100, screensize.y-100)
