extends Sprite2D

var angular_speed: float = PI


func _process(delta: float) -> void:
	var direction: int = 0 # pass
	if Input.is_action_pressed("ui_left"): #
		direction = -1 #
	if Input.is_action_pressed("ui_right"): #
		direction = 1 #

	rotation += angular_speed * direction * delta #

	
