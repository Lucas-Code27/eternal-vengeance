extends Node2D

@export var spawner:Enemyspawner

func _ready() -> void:
	spawner.spawn(1)
