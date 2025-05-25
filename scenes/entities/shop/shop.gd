extends Node2D
class_name Shop

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.is_shop_openable = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		body.is_shop_openable = false
