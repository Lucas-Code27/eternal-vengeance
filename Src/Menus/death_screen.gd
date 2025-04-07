extends Control


func _ready() -> void:
	AudioManager.active_music_player.stop()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Src/Scenes/testing_scene.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()
