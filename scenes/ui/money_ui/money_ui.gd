extends CanvasLayer
class_name MoneyUi

@onready var money_label: Label = $MarginContainer/MoneyLabel

func _ready() -> void:
	GlobalMoney.money_increased.connect(_on_money_increased)
	GlobalMoney.money_decreased.connect(_on_money_decreased)

func _process(delta: float) -> void:
	money_label.text = "%0.2f$" % GlobalMoney.money

# Create +1/-1 labels when money increases/decreases
# ------------------------------------------------------

func _on_money_increased(amount: float):
	TextEffects.new_money_effect(money_label.global_position, "+%0.2f$" % amount, Color.GREEN, 30)
	
func _on_money_decreased(amount: float):
	TextEffects.new_money_effect(money_label.global_position, "-%0.2f$" % amount, Color.RED, 30)
	
