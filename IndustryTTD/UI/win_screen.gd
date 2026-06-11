extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func SetWinscreen():
	var tween1 = create_tween()
	tween1.tween_property(self, "scale", Vector2.ONE, .6).set_trans(Tween.TRANS_BOUNCE)
	Globals.timeScale = 0
	$HBoxContainer3/HBoxContainer3/Label.text =  str(SaveSystem.saveData.kills)
	$HBoxContainer3/HBoxContainer3/Label2.text =  str(SaveSystem.saveData.resourceMined)
	$HBoxContainer3/HBoxContainer3/Label3.text = str(SaveSystem.saveData.buildingCount)
	$HBoxContainer3/HBoxContainer3/Label4.text =  str(SaveSystem.saveData.researchCount)
	
	SaveSystem.settings.levelWonList[Globals.levelID] += 1
	SaveSystem.WriteSaveSettings()
	
	pass


func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
	pass # Replace with function body.


func _on_endless_pressed() -> void:
	Globals.timeScale = 1
	pass # Replace with function body.
