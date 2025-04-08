extends Camera2D

@export var shakefade:float = 15.0

@export var player:CharacterBody2D

@export var speed:float = 1.0
@export var aim_strength:float = 0.2

var shakeamt:float

func _physics_process(delta: float) -> void:
	
	var player_pos:Vector2 = player.global_position
	var mouseworld:Vector2 = get_viewport().get_mouse_position()
	var desired_pos:Vector2 = lerp(player.global_position,mouseworld, aim_strength)
	
	global_position += (desired_pos - global_position) / (speed / (60 * delta))
	
	if shakeamt > 0:
		shakeamt = lerpf(shakeamt,0,shakeamt * delta)
		
		offset = random_offset()

func add_shake(amount:float) -> void:
	shakeamt += amount

func random_offset() -> Vector2:
	return Vector2(randf_range(-shakeamt,shakeamt),randf_range(-shakeamt,shakeamt))
