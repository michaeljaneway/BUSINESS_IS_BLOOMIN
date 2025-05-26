extends Node2D
class_name Bobber

func _ready() -> void:
	var bob_tween = get_tree().create_tween().bind_node(self).set_loops()
	bob_tween.tween_property(self, "global_position", Vector2(0, -5), 2).as_relative().set_trans(Tween.TRANS_SINE)
	bob_tween.tween_property(self, "global_position", Vector2(0, 5), 2).as_relative().set_trans(Tween.TRANS_SINE)
