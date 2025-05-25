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
