class_name GunPickup extends Area2D

@export var gun:GunStats

func _on_body_entered(body: Node2D) -> void:
	if body.has_node("Pivot/Shootingcomp"):
		body.get_node("Pivot/Shootingcomp").stats = gun
		body.get_node("Pivot/Shootingcomp").emit_signal("statschanged")
		queue_free()
