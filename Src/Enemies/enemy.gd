class_name EnemyMelee extends Area2D

var direction:Vector2

var player:CharacterBody2D

@export var speed:int
@export var damage:int

func _ready() -> void:
	$AnimationPlayer.play("run")
	player = get_parent().find_child("Player")

func _physics_process(_delta: float) -> void:
	direction = global_position.direction_to(player.global_position).normalized()
	
	if direction.x > 0:
		$Sprite2D.flip_h = false
	elif direction.x < 0:
		$Sprite2D.flip_h = true
	
	global_position += direction * speed
	
	for thing in get_overlapping_areas():
		if thing.has_node("HealthComponent"):
			var push_vector = thing.global_position.direction_to(global_position).normalized()
			
			global_position += push_vector/30
	

func _on_health_component_die() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player.find_child("HealthComponent").Hurt(damage)
