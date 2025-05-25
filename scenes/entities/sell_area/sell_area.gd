extends Area2D
class_name SellArea

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.is_in_sell_area = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		body.is_in_sell_area = false
