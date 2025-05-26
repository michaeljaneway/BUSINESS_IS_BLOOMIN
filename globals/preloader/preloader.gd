extends Node

func _ready() -> void:
	# Fonts
	var KAPH_REGULAR = preload("res://assets/fonts/Kaph-Regular.ttf")

	# Images
	var OBJECTS = preload("res://assets/images/objects.png")
	var PLAYER_WALK = preload("res://assets/images/player_walk.png")
	var TILESET = preload("res://assets/images/tileset.png")
	var PLAYER_SHADOW = preload("res://assets/images/player_shadow.png")

	# Music
	var APPLE_CIDER = preload("res://assets/music/apple_cider.ogg")

	# Sounds
	var MANY_COINS_IN_SACK_DROP_SOFT_SURFACE_02 = preload("res://assets/sounds/Many_Coins_In_Sack_Drop_Soft_Surface_02.wav")
	var MANY_COINS_IN_SACK_DROP_SOFT_SURFACE_08 = preload("res://assets/sounds/Many_Coins_In_Sack_Drop_Soft_Surface_08.wav")

	# Tilesets
	var BLOOM_TS = preload("res://assets/tilesets/bloom_ts.tres")
	
	# Particles
	var d = preload("res://assets/particles/plantable_area.tres")
