extends CharacterBody2D
class_name Player

signal opened_shop

@onready var animation_player: AnimationPlayer = $CharSprite/AnimationPlayer
@onready var char_sprite: Sprite2D = $CharSprite

var active_p_area: PlantableArea = null

var can_move: bool = true

var is_shop_openable: bool = false

func _process(delta: float) -> void:
	handle_p_areas()
	
	# Interactions
	if Input.is_action_just_pressed("interact"):
		# Opening shop
		if is_shop_openable:
			opened_shop.emit()
			sell_flowers()
		
		# Planting & Harvesting
		if active_p_area != null:
			if active_p_area.plant == null:
				plant_flower()
			elif active_p_area.harvestable:
				active_p_area.harvest()


# Handle plantable areas
func handle_p_areas():
	var pp = PhysicsPointQueryParameters2D.new()
	pp.collide_with_areas = true 
	pp.position = global_position
	pp.collision_mask = 0 + (1 << 3)
	
	# Check if we're on a plantable area
	var p_areas: Array[Dictionary] = get_world_2d().direct_space_state.intersect_point(pp, 1)
	if p_areas.size() != 0:
		# Deactivate old area (if there is one) and switch for new one
		var p_area: PlantableArea = p_areas[0]['collider']
		if active_p_area != null and p_area != active_p_area:
			active_p_area.deactivate()
		active_p_area = p_area
		active_p_area.activate()
	
	# Handle if we're not on a p_area
	else:
		if active_p_area != null:
			active_p_area.deactivate()
			active_p_area = null

# Plants the first plant bag we have available
func plant_flower():
	for plant_type in Plants.types:
		if GlobalInventory.sacks[plant_type.inv_index] == 0:
			continue
		
		GlobalEffects.plant.play()
		GlobalInventory.sacks[plant_type.inv_index] -= 1
		active_p_area.plant_flower(plant_type)
		break

# Sell all of the flowers that we have
func sell_flowers():
	for plant_type in Plants.types:
		if GlobalInventory.flowers[plant_type.inv_index] == 0:
			continue
		
		GlobalEffects.sell.play()
		GlobalInventory.flowers[plant_type.inv_index] -= 1
		GlobalMoney.increase(plant_type.sale_val)
		break

# Handle physics
func _physics_process(delta):
	if not can_move:
		return
	
	# Move
	var direction = Vector2(Input.get_axis('ui_left', 'ui_right'), Input.get_axis('ui_up', 'ui_down')).normalized()
	var speed = 150
	if Input.is_action_pressed("run"):
		speed += 100
	direction *= delta * speed

	# Move Animations
	char_sprite.flip_h = false
	if direction.length() > 0:
		position += direction
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animation_player.play("Side")
			else:
				char_sprite.flip_h = true
				animation_player.play("Side")
		else:
			if direction.y > 0:
				animation_player.play("Down")
			else:
				animation_player.play("Up")
	# Idle Animation
	else:
		animation_player.play("RESET")
	
	move_and_slide()
