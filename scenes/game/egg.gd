extends RigidBody2D

func _physics_process(delta):
	var dist = global_position.x - get_global_mouse_position().x
	var speed = -5 * delta
	#apply_force(Vector2(dist * speed, 0))
