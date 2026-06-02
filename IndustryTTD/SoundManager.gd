extends Node

func _process(delta: float) -> void:
	if get_tree().paused:
		
		$Music.bus = "PauseMusic"
	else:
		$Music.bus = "Music"# AudioServer.get_bus_channels(AudioServer.get_bus_index("Music"))
	pass

func ButtonSound():
	Globals.PitchAudioAsNote(randi_range(-4,2), $Button)
	
	pass
	
func ButtonSound2():
	Globals.PitchAudioAsNote(randi_range(-4,2), $Button2)
	
	pass
