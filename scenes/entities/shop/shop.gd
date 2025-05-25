extends Node2D
class_name Shop

@onready var sprites: Node2D = $Sprites

func _ready() -> void:
	var bob_tween = get_tree().create_tween().bind_node(self).set_loops()
	bob_tween.tween_property(sprites, "global_position", Vector2(0, -5), 2).as_relative().set_trans(Tween.TRANS_SINE)
	bob_tween.tween_property(sprites, "global_position", Vector2(0, 5), 2).as_relative().set_trans(Tween.TRANS_SINE)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.is_shop_openable = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		body.is_shop_openable = false
