extends Area2D

@onready var player:CharacterBody2D = get_parent().get_node("Player")
@onready var shooter:ShootingComponent2D = $Node2D/ShootingComponent2D
@onready var healthbar:ProgressBar = $ProgressBar
@onready var health:HealthComponent = $HealthComponent

var canshoot:bool = true

func _ready() -> void:
	$AnimationPlayer.play("george")
	healthbar.max_value = health.Max_Health
	healthbar.value = healthbar.max_value

func _process(delta: float) -> void:
	$Node2D.look_at(player.global_position)

func _physics_process(delta: float) -> void:
	
	healthbar.value = health.Health
	
	if canshoot:
		shooter.shoot()
		canshoot = false
		$Timer.start(shooter.stats.cooldowntime)


func _on_timer_timeout() -> void:
	canshoot = true


func _on_health_component_die() -> void:
	get_tree().change_scene_to_file("res://Src/Menus/WinScreen.tscn")
