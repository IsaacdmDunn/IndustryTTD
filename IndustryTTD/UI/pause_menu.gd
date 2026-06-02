extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_save_and_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().current_scene.queue_free()
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
	pass # Replace with function body.


func _on_continue_pressed() -> void:
	get_tree().get_first_node_in_group("GameUI").PauseGame(false)
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	var tween = create_tween()
	tween.tween_property($Settings, "scale", Vector2.ONE, .16).set_trans(Tween.TRANS_BOUNCE)
	pass # Replace with function body.

func CloseSettings():
	var tween = create_tween()
	tween.tween_property($Settings, "scale", Vector2.ZERO, .16).set_trans(Tween.TRANS_BOUNCE)
	
	pass
