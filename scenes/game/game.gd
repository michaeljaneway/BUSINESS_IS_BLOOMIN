extends Node2D
class_name Game

@onready var player: Player = $Player

@onready var shop: Shop = $Shop
@onready var shop_ui: ShopUi = $UiLayer/ShopUi
@onready var win_ui: CanvasLayer = $UiLayer/WinUi

var has_won: bool = false

func _ready() -> void:
	shop_ui.hide()
	player.opened_shop.connect(_on_opened_shop)

func _process(delta: float) -> void:
	if GlobalMoney.money > 10000 and not has_won:
		win_ui.show()
		has_won = true

func _on_opened_shop():
	shop_ui.show()
