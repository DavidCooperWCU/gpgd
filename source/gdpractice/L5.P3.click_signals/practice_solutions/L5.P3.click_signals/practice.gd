extends Node

func _ready() -> void:
	for child in get_children(): #pass
		if child.has_signal("ball_popped"): #
			connect_child(child) #

func connect_child(child:Node):
	child.ball_popped.connect(clicked) # pass
	
func clicked():
	$BallPopped.play() # pass
	
