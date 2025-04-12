class_name Bullet2D extends Area2D

# Stats set by ShootingComponent2D node
var speed:int
var damage:int
var pierce:int

# Direction to move in
var direction:Vector2

func _physics_process(_delta: float) -> void:
	# Handle Movement
	global_position += direction * speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.has_node("HealthComponent"):
		if pierce > 0:
			area.get_node("HealthComponent").Hurt(damage)
			pierce -= 1
			
			if pierce == 0:
				queue_free()
				
		else:
			queue_free()
