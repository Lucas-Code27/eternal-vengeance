extends Node2D

@export var spawner:Enemyspawner

@export var pickupspawns:Array[Enemyspawner]

var waves:int = 1

func _ready() -> void:
	$BigGeorge.set_physics_process(false)
	$BigGeorge.monitorable = false
	$BigGeorge.visible = false
	
	AudioManager.play_song("fight")
	wave(false)


func wave(weapon:bool) -> void:
	waves += 1
	
	spawner.spawn(15)
	
	if weapon:
		for spawn in pickupspawns:
			if randi_range(1,12) < 4:
				spawn.spawn(1)
	
	$Timer.start()


func _on_timer_timeout() -> void:
	wave(true)
	
	if waves == 8:
		$Timer.wait_time = 7.5
		AudioManager.active_music_player.stop()
		AudioManager.play_sound("boss")
		$BigGeorge.set_physics_process(true)
		$BigGeorge.monitorable = true
		$BigGeorge.visible = true
		AudioManager.active_music_player.play()
