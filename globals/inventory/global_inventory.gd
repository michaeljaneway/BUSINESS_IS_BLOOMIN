extends Node

var sacks: Array[int]
var flowers: Array[int]

func _ready() -> void:
	reset()

# Resets the inventory
func reset():
	for i in Plants.types:
		sacks.append(0)
		flowers.append(0)
