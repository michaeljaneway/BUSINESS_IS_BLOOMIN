extends Node2D
class_name Game

@onready var player: Player = $Player

@onready var shop_ui: ShopUi = $UiLayer/ShopUi
@onready var win_ui: CanvasLayer = $UiLayer/WinUi

var has_won: bool = false

func _ready() -> void:
	shop_ui.hide()
	GlobalMusic.sea.play()
	player.opened_shop.connect(_on_opened_shop)

func _on_opened_shop():
	if GlobalMoney.money >= 1.50 and not has_won:
		win_ui.show()
		has_won = true
	else:
		shop_ui.show()
