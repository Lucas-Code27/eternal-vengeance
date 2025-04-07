extends Node2D

@export var spawner:Enemyspawner

@export var pickupspawns:Array[Enemyspawner]

func _ready() -> void:
	AudioManager.play_song("fight")
	
	spawner.spawn(20)
	
	for spawn in pickupspawns:
		if randi_range(1,12) > 4:
			spawn.spawn(1)
