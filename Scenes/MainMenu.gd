extends Container

func _ready():
	$Music.play(globalVars.playback_point)
