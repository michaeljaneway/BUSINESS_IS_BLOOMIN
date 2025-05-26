extends CanvasLayer
class_name ShopUi

const FLOWER_UI = preload("res://scenes/ui/flower_ui/flower_ui.tscn")
@onready var sales_grid: GridContainer = %SalesGrid
@onready var buy_items_tutorial: Bobber = $BuyItemsTutorial

func _ready() -> void:
	for flower in Plants.types:
		var new_flower = FLOWER_UI.instantiate()
		new_flower.f_data = flower
		sales_grid.add_child(new_flower)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		exit_shop()
		
	if GlobalTutorial.has_entered_store and not GlobalTutorial.has_bought_items:
		buy_items_tutorial.visible = true
	else:
		buy_items_tutorial.visible = false

func exit_shop():
	self.hide()

func _on_exit_button_pressed() -> void:
	exit_shop()
