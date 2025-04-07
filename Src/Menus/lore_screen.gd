extends Control

func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	AudioManager.active_music_player.stop()
	get_tree().change_scene_to_file("res://Src/Scenes/testing_scene.tscn")
