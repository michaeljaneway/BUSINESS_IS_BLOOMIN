extends Node2D
class_name Shop

@onready var sprites: Node2D = $Sprites
@onready var enter_store_tutorial: Bobber = $EnterStoreTutorial
@onready var sell_items_tutorial: Bobber = $SellItemsTutorial

func _ready() -> void:
	var bob_tween = get_tree().create_tween().bind_node(self).set_loops()
	bob_tween.tween_property(sprites, "global_position", Vector2(0, -5), 2).as_relative().set_trans(Tween.TRANS_SINE)
	bob_tween.tween_property(sprites, "global_position", Vector2(0, 5), 2).as_relative().set_trans(Tween.TRANS_SINE)

func _process(delta: float) -> void:
	if GlobalTutorial.has_moved and not GlobalTutorial.has_entered_store:
		enter_store_tutorial.visible = true
	else:
		enter_store_tutorial.visible = false
	
	if GlobalTutorial.has_harvested_flower and not GlobalTutorial.has_sold_flower:
		sell_items_tutorial.visible = true
	else:
		sell_items_tutorial.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.is_shop_openable = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		body.is_shop_openable = false
