extends CharacterBody2D

@onready var shooter:ShootingComponent2D = $Shootingcomp
@onready var cooldown:Timer = $cooldown

var speed:int = 300
var cooldowntime:float = 0.3

var canshoot:bool = true

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") and canshoot:
		shooter.shoot(20,1)
		$cooldown.start(cooldowntime)
		canshoot = false
	
	var direction := Input.get_vector("left", "right","up","down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()
	look_at(get_global_mouse_position())


func _on_cooldown_timeout() -> void:
	canshoot = true
