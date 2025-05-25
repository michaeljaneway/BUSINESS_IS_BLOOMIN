extends CanvasLayer
class_name InventoryUi

const INV_ICON = preload("res://scenes/ui/inventory_ui/inv_icon/inv_icon.tscn")

@onready var inv_grid: GridContainer = %InvGrid

func _ready() -> void:
	inv_grid.columns = Plants.types.size()
	
	# Flower Icons
	for f_data in Plants.types:
		var new_f_icon = INV_ICON.instantiate()
		new_f_icon.f_data = f_data
		new_f_icon.is_bag = false
		inv_grid.add_child(new_f_icon)
		
	# Bag Icons
	for f_data in Plants.types:
		var new_bag_icon = INV_ICON.instantiate()
		new_bag_icon.f_data = f_data
		new_bag_icon.is_bag = true
		inv_grid.add_child(new_bag_icon)
