extends CanvasLayer
class_name ShopUi

const FLOWER_UI = preload("res://scenes/ui/flower_ui/flower_ui.tscn")
@onready var sales_grid: GridContainer = %SalesGrid

func _ready() -> void:
	for flower in Plants.types:
		var new_flower = FLOWER_UI.instantiate()
		new_flower.f_data = flower
		sales_grid.add_child(new_flower)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		exit_shop()

func exit_shop():
	self.hide()
