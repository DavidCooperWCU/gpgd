extends Sprite2D

var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta 
	var velocity = Vector2.UP.rotated(rotation) * speed 
	position += velocity * delta 


func _on_button_pressed() -> void:
	print("button pressed. change this to actually do something.")
