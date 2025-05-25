extends Area2D
class_name PlantableArea

@onready var color_rect: ColorRect = $ColorRect
@onready var plant_sprite: Sprite2D = $PlantSprite
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

var plant: PlantData = null
var plant_growth_level: int = -1
var harvestable: bool = false

func _ready() -> void:
	plant_sprite.visible = false

func plant_flower(p_data: PlantData):
	plant_sprite.visible = true
	plant = p_data
	grow()

# Grow the plant one stage and create timer callback for next stage (if there is one)
func grow():
	plant_growth_level += 1
	match plant_growth_level:
		0:
			plant_sprite.region_rect = Rect2(plant.tex_index * 16, 32, 16, 16)
		1:
			plant_sprite.region_rect = Rect2(plant.tex_index * 16, 48, 16, 16)
		2:
			plant_sprite.region_rect = Rect2(plant.tex_index * 16, 64, 16, 32)
			plant_sprite.offset.y -= 8
		3:
			plant_sprite.region_rect = Rect2(plant.tex_index * 16, 96, 16, 32)
			harvestable = true
	
	if not harvestable:
		get_tree().create_timer(plant.grow_times[plant_growth_level]).timeout.connect(grow)

# Harvest the plant
func harvest():
	harvestable = false
	gpu_particles_2d.emitting = true
	GlobalInventory.flowers[plant.inv_index] += 1
	GlobalEffects.harvest.play()
	
	plant_sprite.visible = false
	plant_growth_level = -1
	plant_sprite.offset.y += 8
	plant = null

# Activation and deactivation
# -----------------------------------------------------

func activate():
	color_rect.color = Color(Color.WHITE, 0.5)

func deactivate():
	color_rect.color = Color.TRANSPARENT
