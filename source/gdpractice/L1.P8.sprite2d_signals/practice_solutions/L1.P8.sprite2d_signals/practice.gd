extends Sprite2D

var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta 
	var velocity = Vector2.UP.rotated(rotation) * speed 
	position += velocity * delta 


func _on_button_pressed() -> void:
	set_process(not is_processing()) # print("button pressed. change this to actually do something.") 

func _ready() -> void: #
	var timer : Timer = get_node("Timer") #
	timer.timeout.connect(_on_timer_timeout) #

func _on_timer_timeout() -> void: #
	visible = not visible #
