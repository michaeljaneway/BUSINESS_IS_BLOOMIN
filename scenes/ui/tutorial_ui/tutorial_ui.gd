extends Node2D
class_name TutorialUi

@onready var background: Sprite2D = $Background
@onready var newspaper: Sprite2D = $Newspaper
@onready var shopkeep: Sprite2D = $Shopkeep
@onready var hand: Sprite2D = $Hand

@onready var text_1: RichTextLabel = $Text/Text1
@onready var text_2: RichTextLabel = $Text/Text2
@onready var text_3: RichTextLabel = $Text/Text3
@onready var text_4: RichTextLabel = $Text/Text4
@onready var text_5: RichTextLabel = $Text/Text5
@onready var text_6: RichTextLabel = $Text/Text6
@onready var text_10: RichTextLabel = $Text/Text10
@onready var text_7: RichTextLabel = $Text/Text7
@onready var text_8: RichTextLabel = $Text/Text8
@onready var text_9: RichTextLabel = $Text/Text9
@onready var text_12: RichTextLabel = $Text/Text12
@onready var text_13: RichTextLabel = $Text/Text13
@onready var text_11: RichTextLabel = $Text/Text11

var child_slides: int = 0
var text_list: Array[RichTextLabel] = []

func _ready() -> void:
	# Create tutorial text list
	text_list.append(text_1)
	text_list.append(text_2)
	text_list.append(text_3)
	text_list.append(text_4)
	text_list.append(text_5)
	text_list.append(text_6)
	text_list.append(text_10)
	text_list.append(text_7)
	text_list.append(text_8)
	text_list.append(text_9)
	text_list.append(text_12)
	text_list.append(text_13)
	text_list.append(text_11)
	
	for text_i in text_list:
		text_i.modulate = Color.TRANSPARENT
		text_i.visible = true
	
	child_slides = get_child_count()
	
	var tutorial_tween = get_tree().create_tween().bind_node(self)
	self.modulate = Color.BLACK
	
	# Start
	tutorial_tween.tween_callback(GlobalMusic.apple_cider.stop)
	tutorial_tween.tween_callback(GlobalMusic.island.play)
	tutorial_tween.tween_property(self, "modulate", Color.WHITE, 2)
	
	tutorial_tween.tween_interval(1)
	show_text(tutorial_tween, text_1, 5)
	hide_text(tutorial_tween, text_1)
	
	# Hide newspaper
	tutorial_tween.tween_property(newspaper, "modulate", Color.TRANSPARENT, 3)
	tutorial_tween.parallel()
	tutorial_tween.tween_property(GlobalMusic.island, "pitch_scale", 0.5, 3)
	
	tutorial_tween.tween_interval(0.5)
	tutorial_tween.tween_callback(GlobalEffects.foghorn.play)
	tutorial_tween.tween_callback(GlobalMusic.island.stop)
	show_text(tutorial_tween, text_2, 3)
	hide_text(tutorial_tween, text_2)
	
	tutorial_tween.tween_callback(GlobalEffects.splash.play)
	tutorial_tween.parallel()
	tutorial_tween.tween_property(shopkeep, "global_position", Vector2(311, 48), 1)
	tutorial_tween.tween_callback(GlobalMusic.monkeys.play)
	
	show_text(tutorial_tween, text_3, 3)
	hide_text(tutorial_tween, text_3)
	
	show_text(tutorial_tween, text_4, 4)
	hide_text(tutorial_tween, text_4)
	
	show_text(tutorial_tween, text_5, 4)
	hide_text(tutorial_tween, text_5)
	
	show_text(tutorial_tween, text_6, 7)
	hide_text(tutorial_tween, text_6)
	
	show_text(tutorial_tween, text_10, 7)
	hide_text(tutorial_tween, text_10)
	
	show_text(tutorial_tween, text_7, 6)
	hide_text(tutorial_tween, text_7)
	
	tutorial_tween.tween_property(hand, "global_position", Vector2(0, 0), 1.5)
	tutorial_tween.tween_callback(GlobalEffects.fanfare.play)
	tutorial_tween.tween_interval(0.5)
	
	show_text(tutorial_tween, text_8, 6)
	hide_text(tutorial_tween, text_8)
	
	show_text(tutorial_tween, text_9, 6)
	hide_text(tutorial_tween, text_9)
	
	show_text(tutorial_tween, text_12, 5)
	hide_text(tutorial_tween, text_12)
	
	show_text(tutorial_tween, text_13, 6)
	hide_text(tutorial_tween, text_13)
	
	show_text(tutorial_tween, text_11, 4)
	hide_text(tutorial_tween, text_11)
	
	tutorial_tween.tween_property(self, "modulate", Color.BLACK, 3)
	
	# Go to next page
	tutorial_tween.tween_callback(GlobalMusic.monkeys.stop)
	tutorial_tween.tween_callback(GlobalMusic.apple_cider.play)
	tutorial_tween.tween_callback(get_tree().change_scene_to_file.bind("res://scenes/game/game.tscn"))


func show_text(tween: Tween, text: RichTextLabel, delay: float):
	tween.tween_property(text, "modulate", Color.WHITE, 0.2)
	tween.tween_interval(delay)
	
func hide_text(tween: Tween, text: RichTextLabel):
	tween.tween_property(text, "modulate", Color.TRANSPARENT, 0.2)
