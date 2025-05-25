extends Resource
class_name PlantData

@export var name: String = ""
@export var grow_times: Array[float] = []
@export var tex_index: int = 0
@export var inv_index: int = 0
@export var flower_color: Color = Color.WHITE
@export var price: float = 1
@export var sale_val: float = 2

func _init(_name: String = '', _grow_times: Array[float] = [], _tex_index: int = 0, _inv_index: int = 0, _flower_color: Color = Color.WHITE, _price: float = 1,  _sale_val: float = 2) -> void:
	self.name = _name
	self.grow_times = _grow_times
	self.tex_index = _tex_index
	self.inv_index = _inv_index
	self.flower_color = _flower_color
	self.price = _price
	self.sale_val = _sale_val
