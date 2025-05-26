extends Node2D
class_name MainMenu

func _ready() -> void:
	GlobalMusic.sea.stop()

func _on_play_button_pressed() -> void:
	var fade_out_tween = get_tree().create_tween().bind_node(self)
	fade_out_tween.tween_property(self, "modulate", Color.BLACK, 2)
	fade_out_tween.tween_callback(get_tree().change_scene_to_file.bind("res://scenes/ui/tutorial_ui/tutorial_ui.tscn"))

func _on_skip_tutorial_button_pressed() -> void:
	var fade_out_tween = get_tree().create_tween().bind_node(self)
	fade_out_tween.tween_property(self, "modulate", Color.BLACK, 2)
	fade_out_tween.tween_callback(get_tree().change_scene_to_file.bind("res://scenes/game/game.tscn"))
