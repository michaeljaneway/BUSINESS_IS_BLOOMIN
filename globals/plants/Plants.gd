extends Node

var types: Array[PlantData] = []

func _ready() -> void:
	types.append(PlantData.new("Rose", [2, 2, 2], 0))
	types.append(PlantData.new("Birds of Paradise", [2, 2, 2], 1))
	
