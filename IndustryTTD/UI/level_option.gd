extends NinePatchRect
var isMouseEntered = false
var levelData: LevelData
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Wave.text = str(levelData.waveLength)
	$VBoxContainer/mapsize.text = str(levelData.levelSize.x) + " ," + str(levelData.levelSize.y)
	$Label.text = levelData.levelName
	$TextureRect.texture = levelData.levelImg
	
	$VBoxContainer/tplays.text = str(SaveSystem.settings.levelPlaysList[levelData.levelID])
	$VBoxContainer/twon.text = str(SaveSystem.settings.levelWonList[levelData.levelID])
	$VBoxContainer/highestWave.text = str(SaveSystem.settings.highestWaveList[levelData.levelID])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and isMouseEntered:
		#set level data to draw from
		Globals.level = levelData.levelScene.resource_path
		Globals.openFromSave = false
		SaveSystem.settings.levelPlaysList[levelData.levelID] += 1
		SaveSystem.WriteSaveSettings()
		get_tree().current_scene.queue_free()
		get_tree().change_scene_to_file(levelData.levelScene.resource_path)
	pass


func _on_mouse_entered() -> void:
	isMouseEntered = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	isMouseEntered = false
	pass # Replace with function body.
