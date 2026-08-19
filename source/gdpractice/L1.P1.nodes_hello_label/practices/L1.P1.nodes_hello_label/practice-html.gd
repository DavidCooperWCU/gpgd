<preamble>
extends Node2D


func _init() -> void:

    # instantiate the label
    var label := Label.new()
</preamble>
<code>
    # set the text
    # set the x position, positive is right
    # set the y position, positive is down
    # set the font size
</code>
<postamble>
    # add the label as a child
    add_child(label)
</postamble>

<test>
extends "res://addons/gdpractice/tester/test.gd"
func _init() -> void:
    side_by_side = true
    pass
func _build_checks() -> void:
    var practice_label := _find_label(_practice)
    var solution_label := _find_label(_solution)
    var check_label_exists := _add_simple_check(
        tr("Add a Label node as a child of the scene"),
        func() -> String:
            return (
                ""
                if practice_label != null
                else tr("No Label node was found as a child of the scene root.")
            )
    )
    var check_text := _add_simple_check(
        tr("Label text matches"),
        func() -> String:
            if practice_label.text != solution_label.text:
                return tr("The Label's text should be \"%s\".") % solution_label.text
            return ""
    )
    check_text.dependencies.append(check_label_exists)
    var check_position := _add_simple_check(
        tr("Label position matches"),
        func() -> String:
            if not practice_label.position.is_equal_approx(solution_label.position):
                return tr("The Label's position should be %s.") % solution_label.position
            return ""
    )
    check_position.dependencies.append(check_label_exists)
    var check_font_size := _add_simple_check(
        tr("Label font size matches"),
        func() -> String:
            var practice_font_size := practice_label.get_theme_font_size("font_size")
            var solution_font_size := solution_label.get_theme_font_size("font_size")
            if practice_font_size != solution_font_size:
                return tr("The Label's font size should be %s.") % solution_font_size
            return ""
    )
    check_font_size.dependencies.append(check_label_exists)
#Returns the first direct child of [param node] that is a [Label], or [code]null[/code]
#if none is found. Matches by type only, not by node name.
func _find_label(node: Node) -> Label:
    for child in node.get_children():
        if child is Label:
            return child
    return null
</test>
