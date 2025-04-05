extends Node

@export var music:Node
@export var sounds:Node

var active_audio_player:AudioStreamPlayer

func play_song(songname:String):
	active_audio_player = music.get_node(songname)
	
	if active_audio_player != null:
		active_audio_player.play()

func play_sound(soundname:String):
	active_audio_player = sounds.get_node(soundname)
	
	if active_audio_player != null:
		active_audio_player.play()
