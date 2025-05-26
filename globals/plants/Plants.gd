extends Node

var types: Array[PlantData] = []

func _ready() -> void:
	types.append(PlantData.new("Rose", [2, 2, 2], 0, 0, Color(0.939, 0.384, 0.517), 1, 1.25))
	types.append(PlantData.new("Strelitzia", [2, 2, 2], 1, 1, Color.ORANGE, 2.5, 3))
	types.append(PlantData.new("Daisy", [2, 2, 2], 2, 2, Color.SKY_BLUE, 10, 11.5))
	types.append(PlantData.new("Marigold", [2, 2, 2], 3, 3, Color.CORAL, 50, 60))
	types.append(PlantData.new("Delphinium", [2, 2, 2], 4, 4, Color.ROYAL_BLUE, 250, 280))
	types.append(PlantData.new("Lavender", [2, 2, 2], 5, 5, Color.MEDIUM_PURPLE, 1000, 1100))
	types.append(PlantData.new("Primrose", [2, 2, 2], 6, 6, Color.WEB_PURPLE, 10000, 12000))
	types.append(PlantData.new("Tulip", [2, 2, 2], 7, 7, Color.HOT_PINK, 50000, 55000))
