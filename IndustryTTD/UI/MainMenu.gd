extends Control
enum MainMenuState {Menu, Settings, Level}
var currentState = MainMenuState.Menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var settingTween: Tween = create_tween()
	settingTween.tween_property($Settings, "scale", Vector2.ZERO, .2)
	
	var levelTween: Tween = create_tween()
	levelTween.tween_property($LevelSelect, "scale", Vector2.ZERO, .2)
	pass # Replace with function body.


func OpenSettings():
	var settingTween: Tween = create_tween()
	settingTween.tween_property($Settings, "scale", Vector2.ONE, .2)
	ToggleMainButtons(true)
	$Settings.visible = true
	pass
	
func CloseSettings():
	var settingTween: Tween = create_tween()
	settingTween.tween_property($Settings, "scale", Vector2.ZERO, .2)
	ToggleMainButtons(false)
	pass
	
func OpenLevelSelector():
	var levelTween: Tween = create_tween()
	levelTween.tween_property($LevelSelect, "scale", Vector2.ONE, .2)
	ToggleMainButtons(true)
	$LevelSelect.visible = true
	pass
	
func CloseLevelSelector():
	var levelTween: Tween = create_tween()
	levelTween.tween_property($LevelSelect, "scale", Vector2.ZERO, .2)

	ToggleMainButtons(false)
	pass
	
func ToggleMainButtons(isOn):
	var buttonTween:Tween = create_tween()
	if isOn:
		buttonTween.tween_property($VBoxContainer, "position", Vector2(600, 0), .2).as_relative().set_trans(Tween.TRANS_BOUNCE)
	else:
		buttonTween.tween_property($VBoxContainer, "position", Vector2(-600, 0), .2).as_relative().set_trans(Tween.TRANS_BOUNCE)
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	#open settings
	currentState = MainMenuState.Settings
	OpenSettings()
	pass # Replace with function body.


func _on_continue_pressed() -> void:
	#open game
	#load game data
	get_tree().current_scene.queue_free()
	get_tree().change_scene_to_file("res://game.tscn")
	pass # Replace with function body.


func _on_start_game_pressed() -> void:
	#open level screen
	currentState = MainMenuState.Level
	OpenLevelSelector()
	pass # Replace with function body.





func _on_button_pressed() -> void:
	CloseLevelSelector()
	pass # Replace with function body.
