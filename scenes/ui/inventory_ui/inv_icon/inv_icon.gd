extends PanelContainer
class_name InvIcon

@onready var icon: TextureRect = %Icon
@export var f_data: PlantData = null
@onready var count_label: Label = %CountLabel

@export var is_bag: bool = false

var last_count: int = 0

func _ready() -> void:
	# Set icon
	var icon_tex: AtlasTexture = icon.texture.duplicate()
	if is_bag:
		icon_tex.region = Rect2(f_data.tex_index * 16, 0, 16, 16)
	else:
		icon_tex.region = Rect2(f_data.tex_index * 16, 16, 16, 16)
	icon.texture = icon_tex

func _process(delta: float) -> void:
	var count = 0
	if is_bag:
		count = GlobalInventory.sacks[f_data.inv_index]
	else:
		count = GlobalInventory.flowers[f_data.inv_index]
	count_label.text = "%d" % count
	
	if count > 0:
		modulate = Color.WHITE
		count_label.visible = true
	else:
		modulate = Color.DIM_GRAY
		count_label.visible = false
	
	if last_count != count:
		if last_count > count:
			TextEffects.new_money_effect(global_position, "-%d" % (last_count - count), Color.WHITE, 20, self)
		else:
			TextEffects.new_money_effect(global_position, "+%d" % (count - last_count), Color.WHITE, 20, self)
	
	last_count = count
