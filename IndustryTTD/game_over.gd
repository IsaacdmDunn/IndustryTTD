extends NinePatchRect


func GameOver():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, 1).set_trans(Tween.TRANS_ELASTIC)
	get_tree().paused = true
	
	$HBoxContainer3/HBoxContainer3/Label.text =  str(SaveSystem.saveData.kills)
	$HBoxContainer3/HBoxContainer3/Label2.text =  str(SaveSystem.saveData.resourceMined)
	$HBoxContainer3/HBoxContainer3/Label3.text =  str(SaveSystem.saveData.buildingCount)
	$HBoxContainer3/HBoxContainer3/Label4.text =  str(SaveSystem.saveData.researchCount)

func _on_restart_pressed() -> void:
	get_tree().paused = false
	if Globals.level != null:
		get_tree().change_scene_to_file(Globals.level)
	else:
		get_tree().change_scene_to_file("res://game.tscn")
	pass # Replace with function body.


func _on_main_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
	pass # Replace with function body.
