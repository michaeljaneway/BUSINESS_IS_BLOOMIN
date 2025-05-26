extends Node2D
class_name Game

@onready var player: Player = $Player

@onready var shop_ui: ShopUi = $UiLayer/ShopUi
@onready var win_ui: CanvasLayer = $UiLayer/WinUi

@onready var plant_flower_tutorial: Bobber = $PlantFlowerTutorial
@onready var harvest_flower_tutorial: Bobber = $HarvestFlowerTutorial

var has_won: bool = false

func _init() -> void:
	self.modulate = Color.BLACK

func _ready() -> void:
	var fade_in_tween = get_tree().create_tween().bind_node(self)
	fade_in_tween.tween_property(self, "modulate", Color.WHITE, 3)
	
	shop_ui.hide()
	GlobalMusic.sea.play()
	player.opened_shop.connect(_on_opened_shop)

func _process(delta: float) -> void:
	if GlobalTutorial.has_bought_items and not GlobalTutorial.has_planted_flower:
		plant_flower_tutorial.visible = true
	else:
		plant_flower_tutorial.visible = false
	
	if GlobalTutorial.has_planted_flower and not GlobalTutorial.has_harvested_flower:
		harvest_flower_tutorial.visible = true
	else:
		harvest_flower_tutorial.visible = false

func _on_opened_shop():
	if GlobalMoney.money >= GlobalMoney.required_amt and not has_won:
		win_ui.show()
		has_won = true
	else:
		shop_ui.show()
