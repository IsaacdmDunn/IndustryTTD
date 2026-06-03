extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func GameOver():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, 1).set_trans(Tween.TRANS_ELASTIC)
	get_tree().paused = true

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
