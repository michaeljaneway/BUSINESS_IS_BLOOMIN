extends Node

var money: float = 1
var required_amt: float = 1000000.00

signal money_increased(amount: float)
signal money_decreased(amount: float)

func increase(amount: float):
	money += amount
	money_increased.emit(amount)

func decrease(amount: float):
	money -= amount
	money_decreased.emit(amount)

func reset():
	money = 1

func display_cash(value: float) -> String:
	var suffixes = ['', 'K', 'M', 'B', 'T', 'Q', ' Bajillion']
	var shifts = 0
	var v = value
	
	while v >= 1000:
		v /= 1000
		shifts += 1
	
	if shifts < suffixes.size():
		return '%0.2f%s' % [v, suffixes[shifts]]
	else:
		return '%0.2f' % [value]
	
