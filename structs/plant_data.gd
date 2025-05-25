extends Resource
class_name PlantData

@export var name: String = ""
@export var grow_times: Array[float] = []
@export var tex_index: int = 0

func _init(_name: String = '', _grow_times: Array[float] = [], _tex_index: int = 0) -> void:
	self.name = _name
	self.grow_times = _grow_times
	self.tex_index = _tex_index
