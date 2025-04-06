class_name Enemyspawner extends Node2D

@export var enemies:Array[PackedScene]

func spawn(count:int):
	for thing in count:
		var enemy_inst = enemies[randi_range(0,len(enemies)-1)].instantiate()
		enemy_inst.global_position = global_position + Vector2(randf_range(-20,20),randf_range(-20,20))
		get_parent().add_child(enemy_inst)
