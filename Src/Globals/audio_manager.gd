extends Node

@export var music:Node
@export var sounds:Node

var active_audio_player:AudioStreamPlayer
var active_music_player:AudioStreamPlayer

func play_song(songname:String):
	active_music_player = music.get_node(songname)
	
	if active_music_player != null:
		active_music_player.play()

func play_sound(soundname:String,pitch:float):
	active_audio_player = sounds.get_node(soundname)
	active_audio_player.pitch_scale = pitch
	
	if active_audio_player != null:
		active_audio_player.play()
