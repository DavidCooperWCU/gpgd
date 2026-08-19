extends Node2D


func _init() -> void:
    # instantiate the label
    var label := Label.new() # pass
    # set the text
    label.text = "Hello, World!" #
    # set the x position, positive is right
    label.position.x = 40 #
    # set the y position, positive is down
    label.position.y = 40 #
    # set the font size
    label.add_theme_font_size_override("font_size", 64) #
    # add the label as a child
    add_child(label) #
