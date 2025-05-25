extends Node2D
class_name TutorialUi

var child_slides: int = 0

func _ready() -> void:
	child_slides = get_child_count()
	
	var tutorial_tween = get_tree().create_tween().bind_node(self)
	
	for child in get_children():
		var child_2d: Node2D = child
		child_2d.modulate = Color.TRANSPARENT
		
		tutorial_tween.tween_property(child_2d, "modulate", Color.WHITE, 2)
		tutorial_tween.tween_interval(5)
		tutorial_tween.tween_property(child_2d, "modulate", Color.TRANSPARENT, 2)
		tutorial_tween.parallel()

	tutorial_tween.tween_callback(get_tree().change_scene_to_file.bind("res://scenes/game/game.tscn"))
