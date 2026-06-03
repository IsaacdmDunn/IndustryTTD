extends Control
@onready var gameManager: GameManager = get_tree().get_first_node_in_group("GameManager") 
@export var buildingUI: PackedScene

func OpenBuildingUI(building):
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	if get_tree().get_nodes_in_group("BuildingUI").size() == 0:
		var UIToSpawn: BuildingUI = buildingUI.instantiate()
		UIToSpawn.position = get_local_mouse_position() #- Vector2((get_viewport().size.x / 2), (get_viewport().size.y / 2))
		if UIToSpawn.position.x > get_viewport().size.x - UIToSpawn.size.x:
			UIToSpawn.position.x = get_viewport().size.x - (UIToSpawn.size.x)
		if UIToSpawn.position.y > get_viewport().size.y - UIToSpawn.size.y:
			UIToSpawn.position.y = get_viewport().size.y - (UIToSpawn.size.y)
		UIToSpawn.building = building
		add_child(UIToSpawn)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.
func PauseGame(togglePause):
	if togglePause:
		
		gameManager.currentGameState = gameManager.GameState.Pause
		var pauseUI = get_tree().get_first_node_in_group("PauseMenu")
		var tween = create_tween()
		tween.tween_property(pauseUI, "scale", Vector2.ONE, .16).set_trans(Tween.TRANS_BOUNCE)
		pauseUI.CloseSettings()
		get_tree().paused = true
	else:
		gameManager.currentGameState = gameManager.GameState.Game
		var pauseUI = get_tree().get_first_node_in_group("PauseMenu")
		var tween = create_tween()
		tween.tween_property(pauseUI, "scale", Vector2.ZERO, .16).set_trans(Tween.TRANS_BOUNCE)
		pauseUI.CloseSettings()
		get_tree().paused = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
			
		if gameManager.currentGameState == gameManager.GameState.Build:	
			var tween3 = create_tween()
			var tooltip = get_tree().get_first_node_in_group("BuildingUITooltip")
			tween3.tween_property(tooltip, "scale", Vector2.ZERO, .16).set_trans(Tween.TRANS_BOUNCE)
			gameManager.currentGameState = gameManager.GameState.Game
			var tween = create_tween()
			tween.tween_property($"../BuildingMenu", "position", Vector2(0,750), .16).set_trans(Tween.TRANS_BOUNCE)
			var tween2 = create_tween()
			tween2.tween_property($BottomUI, "position", Vector2(0,650), .16).set_trans(Tween.TRANS_BOUNCE)
		elif gameManager.currentGameState == gameManager.GameState.Game:
			PauseGame(true)
			get_tree().get_first_node_in_group("SoundManager").ButtonSound()
		elif gameManager.currentGameState == gameManager.GameState.Pause:
			PauseGame(false)
			get_tree().get_first_node_in_group("SoundManager").ButtonSound()
	pass


func _on_build_mode_button_pressed() -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	var tween3 = create_tween()
	var tooltip = get_tree().get_first_node_in_group("BuildingUITooltip")
	tween3.tween_property(tooltip, "scale", Vector2.ONE, .16).set_trans(Tween.TRANS_BOUNCE)
	gameManager.currentGameState = gameManager.GameState.Build
	var tween = create_tween()
	tween.tween_property($"../BuildingMenu", "position", Vector2(0,550), .16).set_trans(Tween.TRANS_BOUNCE)
	var tween2 = create_tween()
	tween2.tween_property($BottomUI, "position", Vector2(0,850), .16).set_trans(Tween.TRANS_BOUNCE)
	pass # Replace with function body.
	
func GameOverUIOpen():
	$"../GameOver".GameOver()
	pass
