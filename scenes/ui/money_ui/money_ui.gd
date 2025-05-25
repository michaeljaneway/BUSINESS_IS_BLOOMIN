extends CanvasLayer
class_name MoneyUi

@onready var money_label: Label = %MoneyLabel
@onready var out_of_label: Label = %OutOfLabel

func _ready() -> void:
	GlobalMoney.money_increased.connect(_on_money_increased)
	GlobalMoney.money_decreased.connect(_on_money_decreased)
	out_of_label.text = "/%s$" % GlobalMoney.display_cash(GlobalMoney.required_amt)

func _process(delta: float) -> void:
	money_label.text = "%0.2f$" % GlobalMoney.money

# Create +1/-1 labels when money increases/decreases
# ------------------------------------------------------

func _on_money_increased(amount: float):
	TextEffects.new_money_effect(money_label.global_position, "+%0.2f$" % amount, Color.GREEN, 30)
	
func _on_money_decreased(amount: float):
	TextEffects.new_money_effect(money_label.global_position, "-%0.2f$" % amount, Color.RED, 30)
	
