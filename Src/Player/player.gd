extends CharacterBody2D

@onready var shooter:ShootingComponent2D = $Pivot/Shootingcomp
@onready var health:HealthComponent = $HealthComponent
@onready var cooldown:Timer = $cooldown
@onready var pivot:Node2D = $Pivot

var speed:int = 150
@onready var cooldowntime:float = shooter.stats.cooldowntime

var canshoot:bool = true

func _ready() -> void:
	$AnimationPlayer.play("idle")

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") and canshoot:
		shooter.shoot()
		$cooldown.start(cooldowntime)
		canshoot = false
	
	var direction := Input.get_vector("left", "right","up","down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	if direction.x > 0:
		$Sprite2D.flip_h = false
	elif direction.x < 0:
		$Sprite2D.flip_h = true
	
	move_and_slide()
	pivot.look_at(get_global_mouse_position())


func _on_cooldown_timeout() -> void:
	canshoot = true


func _on_shootingcomp_statschanged() -> void:
	cooldowntime = shooter.stats.cooldowntime


func _on_health_component_die() -> void:
	get_tree().reload_current_scene()
