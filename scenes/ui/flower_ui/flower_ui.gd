extends PanelContainer
class_name FlowerUi

@export var f_data: PlantData = null

@onready var flower_name: Label = $MarginContainer/HBoxContainer/VBoxContainer/FlowerName
@onready var flower_price: RichTextLabel = $MarginContainer/HBoxContainer/VBoxContainer/FlowerPrice

@onready var flower: TextureRect = $MarginContainer/HBoxContainer/HBoxContainer/Flower
@onready var flower_bag: TextureRect = $MarginContainer/HBoxContainer/HBoxContainer/FlowerBag

var buyable: bool = false
var mouse_hovering: bool = false

func _ready() -> void:
	# Set name
	flower_name.text = f_data.name
	
	# Set Price
	flower_price.text = "Buy: [font_size=15][color=skyblue]%s$[/color][/font_size]\nSell: [font_size=15][color=yellow]%s$[/color][/font_size]" % [GlobalMoney.display_cash(f_data.price), GlobalMoney.display_cash(f_data.sale_val)]
	
	# Change panel color
	var new_stylebox: StyleBoxFlat = self.get_theme_stylebox("panel").duplicate()
	new_stylebox.bg_color = f_data.flower_color
	self.add_theme_stylebox_override("panel", new_stylebox)
	
	# Set textures
	var flower_tex: AtlasTexture = flower.texture.duplicate()
	flower_tex.region = Rect2(f_data.tex_index * 16, 0, 16, 16)
	flower.texture = flower_tex
	var flower_bag_tex: AtlasTexture = flower_bag.texture.duplicate()
	flower_bag_tex.region = Rect2(f_data.tex_index * 16, 16, 16, 16)
	flower_bag.texture = flower_bag_tex

func _process(delta: float) -> void:
	if GlobalMoney.money >= f_data.price:
		buyable = true
	else:
		buyable = false
	
	if buyable:
		modulate = Color.WHITE
		if mouse_hovering :
			self_modulate = Color(1.3, 1.3, 1.3)
		else:
			self_modulate = Color(1, 1, 1)
	else:
		modulate = Color.DIM_GRAY

# Click event
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed and buyable:
			GlobalEffects.purchase.play()
			GlobalMoney.decrease(f_data.price)
			GlobalInventory.sacks[f_data.inv_index] += 1
			GlobalTutorial.has_bought_items = true


# Mouse hovering
# ----------------------------------

func _on_mouse_entered() -> void:
	mouse_hovering = true

func _on_mouse_exited() -> void:
	mouse_hovering = false
