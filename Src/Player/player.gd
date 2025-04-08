extends CharacterBody2D

@onready var shooter:ShootingComponent2D = $Pivot/Shootingcomp
@onready var health:HealthComponent = $HealthComponent
@onready var cooldown:Timer = $cooldown
@onready var pivot:Node2D = $Pivot

@onready var camera:Camera2D = get_parent().get_node("Camera")

var speed:int = 150
@onready var cooldowntime:float = shooter.stats.cooldowntime

var canshoot:bool = true
var canroll:bool = true
var rolling:bool = false

func _ready() -> void:
	$AnimationPlayer.play("idle")

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") and canshoot and !rolling:
		shooter.shoot()
		camera.add_shake(0.1)
		AudioManager.play_sound("shot",randf_range(0.9,1.1))
		$cooldown.start(cooldowntime)
		canshoot = false
	
	var direction := Input.get_vector("left", "right","up","down")
	if direction and !rolling:
		velocity = direction * speed
	elif !rolling:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	if Input.is_action_just_pressed("Roll") and !rolling:
		$CPUParticles2D.emitting = true
		velocity = direction * speed * 4
		camera.add_shake(0.2)
		rolling = true
		canroll = false
		health.invincible = true
		$invulnerability.start()
	if rolling:
		velocity.x = move_toward(velocity.x, 0, round(speed/4))
		velocity.y = move_toward(velocity.y, 0, round(speed/4))
	if velocity.length() <= 2:
		rolling = false
	
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
	get_tree().change_scene_to_file("res://Src/Menus/DeathScreen.tscn")


func _on_invulnerability_timeout() -> void:
	health.invincible = false
	await get_tree().create_timer(0.5).timeout
	canroll = true


func _on_health_component_hit() -> void:
	camera.add_shake(2)
