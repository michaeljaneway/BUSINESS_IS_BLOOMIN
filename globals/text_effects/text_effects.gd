extends CanvasLayer

const KAPH_REGULAR = preload("res://assets/fonts/Kaph-Regular.ttf")

func new_money_effect(g_pos: Vector2, effect_str: String, col: Color, font_size: int, parent: Node = null):
	# Create new label
	var new_label = Label.new()
	new_label.global_position = g_pos
	new_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	new_label.text = effect_str
	new_label.label_settings = LabelSettings.new()
	new_label.label_settings.font = KAPH_REGULAR
	new_label.label_settings.font_color = col
	new_label.label_settings.font_size = font_size
	
	if parent == null:
		self.add_child(new_label)
	else:
		parent.add_child(new_label)
	
	# Animate Label
	var new_tween = get_tree().create_tween().bind_node(new_label)
	new_tween.tween_property(new_label, "global_position", Vector2(randf_range(-100, 100), -100), randf_range(1, 2)).as_relative()
	new_tween.parallel().tween_property(new_label, "modulate", Color.TRANSPARENT, randf_range(1, 2))
	new_tween.tween_callback(new_label.queue_free)
