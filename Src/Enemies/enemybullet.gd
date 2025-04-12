extends Bullet2D

func _physics_process(_delta: float) -> void:
	# Handle Movement
	global_position += direction * speed

func _on_body_entered(body: Node2D) -> void:
	if body.get_node("HealthComponent").invincible != true:
		body.get_node("HealthComponent").Hurt(damage)
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
