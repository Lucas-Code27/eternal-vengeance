class_name SettingsMenu extends Control

var active:bool = false

func toggle() -> void:
	active = !active
	visible = active


func _on_close_pressed() -> void:
	toggle()
