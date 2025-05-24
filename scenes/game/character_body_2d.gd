extends CharacterBody2D

func _physics_process(delta):
	var direction = Vector2(Input.get_axis('ui_left', 'ui_right'), 0).normalized()
	direction *= delta * 200
	
	# Don't move if no inputs
	if direction.length() > 0:
		position += direction
	
	move_and_slide()
