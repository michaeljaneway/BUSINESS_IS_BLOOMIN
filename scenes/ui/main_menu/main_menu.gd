extends Node2D
class_name MainMenu

func _ready() -> void:
	GlobalMusic.sea.stop()

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/tutorial_ui/tutorial_ui.tscn")


func _on_skip_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
