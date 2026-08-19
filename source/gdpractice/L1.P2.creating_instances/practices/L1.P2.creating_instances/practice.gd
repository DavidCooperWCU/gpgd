extends Node

@export var Ball: PackedScene








func _input(event):
    if event.is_action_pressed("click"):
        var clicked : Vector2 = get_viewport().get_mouse_position()
