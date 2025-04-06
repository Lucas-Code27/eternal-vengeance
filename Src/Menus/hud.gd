extends Control

@export var player:CharacterBody2D

func _ready() -> void:
	player.shooter.connect("statschanged",_on_player_gun_change)
	player.health.connect("Hit",_on_player_hit)
	$healthbar.max_value = player.health.Max_Health
	$healthbar.value = player.health.Max_Health

func _on_player_gun_change() -> void:
	$gun.text = str(player.shooter.stats.resource_path.get_file().trim_suffix(".tres"))

func _on_player_hit() -> void:
	$healthbar.value = player.health.Health
