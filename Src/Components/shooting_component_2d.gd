class_name ShootingComponent2D extends Node2D
# This Node2D allows for the firing of a Bullet2D node
# It uses Node2D to have a position to fire from

signal statschanged

# Scene of projectile to spawn
@export var projectile:PackedScene
@export var stats:GunStats

@export var parent:Node

@onready var scene:Node = parent.get_parent()

func shoot() -> void:
	# Instantiate the Projectile
	for bullet in stats.bullet_amnt:
		var bullet_inst:Bullet2D = projectile.instantiate()
		var spread_amnt:float = randf_range(-stats.spread,stats.spread)
		
		# Position and Direction to move
		bullet_inst.global_position = global_position
		bullet_inst.global_rotation = global_rotation + spread_amnt
		bullet_inst.direction = Vector2.RIGHT.rotated(global_rotation + spread_amnt)
		
		# Set Stats
		bullet_inst.speed = stats.speed
		bullet_inst.damage = stats.damage
		
		# Release it to the world
		scene.add_child(bullet_inst)
