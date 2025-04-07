extends Control

func _ready() -> void:
	AudioManager.active_music_player.stop()

func _on_button_pressed() -> void:
	get_tree().quit()
