extends Area2D

var direction:Vector2
var cooldown:float

var player:CharacterBody2D

@export var shooter:ShootingComponent2D

@export var followdist:int

@export var speed:int

var canshoot:bool = true

func _ready() -> void:
	$AnimationPlayer.play("float")
	player = get_parent().find_child("Player")
	cooldown = shooter.stats.cooldowntime

func _physics_process(_delta: float) -> void:
	if global_position.distance_to(player.global_position) > followdist:
		direction = global_position.direction_to(player.global_position).normalized()
	else:
		if canshoot:
			shooter.shoot()
			canshoot = false
			$Timer.start(cooldown + randf_range(-0.1,0.1))
		
		direction = Vector2(0,0)
	
	if direction.x > 0:
		$Sprite2D.flip_h = false
	elif direction.x < 0:
		$Sprite2D.flip_h = true
	
	global_position += direction * speed
	$Node2D.look_at(player.global_position)
	
	for thing in get_overlapping_areas():
		if thing.has_node("HealthComponent"):
			var push_vector = thing.global_position.direction_to(global_position).normalized()
			
			global_position += push_vector/30
	

func _on_health_component_die() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player.find_child("HealthComponent").Hurt(1)


func _on_timer_timeout() -> void:
	canshoot = true
