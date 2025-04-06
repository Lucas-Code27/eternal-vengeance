extends Control

var paused:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		paused = true
		visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_close_pressed() -> void:
	$SettingsMenu.visible = true
	get_tree().paused = false
	paused = false
	visible = false
