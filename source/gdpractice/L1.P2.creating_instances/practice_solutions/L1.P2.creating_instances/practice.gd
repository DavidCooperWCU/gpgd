extends Node

@export var Ball: PackedScene

var firstBall : RigidBody2D = null #

func _init() -> void: #
    # 1. Create a unique action name #
    var action_name = "click" #

    # 2. Add the action if it doesn't exist #
    if not InputMap.has_action(action_name): #
        print("adding action " + action_name) #
        InputMap.add_action(action_name) #

        # 3. Create and assign a physical key (e.g., the 'G' key) #
        var event = InputEventMouseButton.new() #
        event.button_index = MOUSE_BUTTON_LEFT #


        # 4. Attach the event to your new action #
        InputMap.action_add_event(action_name, event) #


func _input(event):
    if event.is_action_pressed("click"):
        var new_ball = Ball.instantiate() #
        if firstBall == null: #
            firstBall = new_ball #
        new_ball.position = get_viewport().get_mouse_position() # var clicked : Vector2 = get_viewport().get_mouse_position()
        add_child(new_ball) #
    if event.is_action_pressed("ui_up"): #
        if firstBall != null: #
            firstBall.physics_material_override.bounce += 0.1 #
            if firstBall.physics_material_override.bounce > 0.9: #
                firstBall.physics_material_override.bounce = 0.9 #
    if event.is_action_pressed("ui_down"): #
        if firstBall != null: #
            firstBall.physics_material_override.bounce -= 0.1 #
            if firstBall.physics_material_override.bounce < 0.0: #
                firstBall.physics_material_override.bounce = 0.0 #
