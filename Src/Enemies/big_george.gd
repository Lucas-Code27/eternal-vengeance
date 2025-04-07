extends Area2D

@onready var player:CharacterBody2D = get_parent().get_node("Player")
@onready var shooter:ShootingComponent2D = $Node2D/ShootingComponent2D

var canshoot:bool = true

func _ready() -> void:
	$AnimationPlayer.play("george")

func _process(delta: float) -> void:
	$Node2D.look_at(player.global_position)

func _physics_process(delta: float) -> void:
	if canshoot:
		shooter.shoot()
		canshoot = false
		$Timer.start(shooter.stats.cooldowntime)


func _on_timer_timeout() -> void:
	canshoot = true


func _on_health_component_die() -> void:
	get_tree().change_scene_to_file("res://Src/Menus/WinScreen.tscn")
