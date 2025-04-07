extends Control

@export var Next_Scene:PackedScene
@export var Settings_Menu:SettingsMenu

@export_group("Music")
@export var menu_song:String

@export_group("Buttons")
@export var Play:Button
@export var Settings:Button
@export var Quit:Button

func _ready() -> void:
	
	$Sprite2D/AnimationPlayer.play("menu")
	
	# Play Menu Song
	AudioManager.play_song(menu_song)
	
	# Connect signals
	Play.connect("pressed", Start)
	Settings.connect("pressed", OpenSettings)
	Quit.connect("pressed", Close)
	
	# Get Settings Ready
	Settings_Menu.active = false

func Start() -> void:
	get_tree().call_deferred("change_scene_to_packed",Next_Scene)

func OpenSettings() -> void:
	Settings_Menu.toggle()

func Close() -> void:
	get_tree().call_deferred("quit")
