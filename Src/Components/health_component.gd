extends Node
class_name HealthComponent

# Signals
signal Die
signal Hit

# Vars
@export_group("Stats")
@export var Max_Health:int
var Health:int

var invincible:bool = false

func _ready() -> void:
	Health = Max_Health

# Taking Damage
func Hurt(damage:int) -> void:
	if invincible:
		return
	
	Health -= damage
	Hit.emit()
	
	# Checking for death
	if Health <= 0:
		Die.emit()
