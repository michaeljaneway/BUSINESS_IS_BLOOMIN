extends Node2D
class_name Item

@export var item_name: String = ''

@onready var item_label: RichTextLabel = $ItemLabel

var player: Player = null

func _ready() -> void:
	item_label.text = item_name
	item_label.visible = false

func _process(delta: float) -> void:
	if player:
		var dir = player.global_position.direction_to(get_global_mouse_position())
		global_position = player.global_position + dir * 25

# Item Grabbing
# ---------------------------------

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body

# Item Tooltips
# ---------------------------------

func _on_button_mouse_entered() -> void:
	item_label.visible = true

func _on_button_mouse_exited() -> void:
	item_label.visible = false
