extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveSystem.LoadSaveSettings()
	$VBox/Music/HSlider.value = SaveSystem.settings.musicVolume
	$VBox/SFX/HSlider.value = SaveSystem.settings.sfxVolume
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
		
	pass

func _on_cancel_pressed() -> void:
	get_parent().CloseSettings()
	$VBox/Music/HSlider.value = SaveSystem.settings.musicVolume
	$VBox/SFX/HSlider.value = SaveSystem.settings.sfxVolume
	AudioServer.set_bus_volume_linear(1, SaveSystem.settings.musicVolume)
	AudioServer.set_bus_volume_linear(2, SaveSystem.settings.sfxVolume)
	pass # Replace with function body.


func _on_apply_pressed() -> void:
	#save settings
	SaveSystem.settings.musicVolume = $VBox/Music/HSlider.value
	SaveSystem.settings.sfxVolume = $VBox/SFX/HSlider.value
	SaveSystem.WriteSaveSettings()
	get_parent().CloseSettings()
	pass # Replace with function body.




func OnMusicChanged(value: float) -> void:
	
	AudioServer.set_bus_volume_linear(1, $VBox/Music/HSlider.value)
	pass # Replace with function body.


func SFXVolumeChanged(value: float) -> void:
	AudioServer.set_bus_volume_linear(2, $VBox/SFX/HSlider.value)
	pass # Replace with function body.
