extends Node2D
class_name Game

@onready var player: Player = $Player

@onready var shop: Shop = $Shop
@onready var shop_ui: ShopUi = $UiLayer/ShopUi

func _ready() -> void:
	shop_ui.hide()
	player.opened_shop.connect(_on_opened_shop)

func _on_opened_shop():
	shop_ui.show()
