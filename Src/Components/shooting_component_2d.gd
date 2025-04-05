class_name ShootingComponent2D extends Node2D
# This Node2D allows for the firing of a Bullet2D node
# It uses Node2D to have a position to fire from

# Scene of projectile to spawn
@export var projectile:PackedScene

@onready var parent_node:Node = get_parent().get_parent()

func shoot(speed:int,damage:int) -> void:
	# Instantiate the Projectile
	var bullet_inst:Bullet2D = projectile.instantiate()
	
	# Position and Direction to move
	bullet_inst.global_position = global_position
	bullet_inst.direction = Vector2.RIGHT.rotated(global_rotation)
	
	# Set Stats
	bullet_inst.speed = speed
	bullet_inst.damage = damage
	
	# Release it to the world
	parent_node.add_child(bullet_inst)
