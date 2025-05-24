extends CharacterBody2D
class_name Player

@onready var animation_player: AnimationPlayer = $CharSprite/AnimationPlayer
@onready var char_sprite: Sprite2D = $CharSprite

func _physics_process(delta):
	var direction = Vector2(Input.get_axis('ui_left', 'ui_right'), Input.get_axis('ui_up', 'ui_down')).normalized()
	direction *= delta * 150
	
	char_sprite.flip_h = false
	
	# Don't move if no inputs
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
	
	# Idle
	else:
		animation_player.play("RESET")
	
	move_and_slide()
