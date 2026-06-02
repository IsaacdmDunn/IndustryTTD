extends Control
class_name ResearchManager
var isOpen = false
@export var reseachOptionPrefab: PackedScene
var currentSelectedResearch = 0
var currentResearch: Research
# Called when the node enters the scene tree for the first time.
@onready var Info = $NinePatchRect/Info
var gameManager: GameManager

func UpdateLeftReseachUI(research: Research):
	currentSelectedResearch = research.researchID
	$NinePatchRect/Info/TextureRect.texture = research.researchImage
	$NinePatchRect/Info/Label.text = research.researchName
	$NinePatchRect/Info/VBoxContainer/Label.text = research.researchDescription
	$NinePatchRect/Info/VBoxContainer/ProgressBar.max_value = research.researchAmount
	$NinePatchRect/Info/VBoxContainer/ProgressBar.value = 100 / research.researchLeft
	pass

func _ready() -> void:
	gameManager = get_tree().get_first_node_in_group("GameManager")
	for research in get_tree().get_first_node_in_group("GameManager").ResearchList:
		var optionToAdd = reseachOptionPrefab.instantiate()
		optionToAdd.research = research
		$NinePatchRect/OptionPanel/ScrollContainer/VBoxContainer.add_child(optionToAdd)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if currentResearch != null:
		var canResearch = true
		for resourceID in currentResearch.resourceRequiredID.size():
			if gameManager.GameResourceList[resourceID] < currentResearch.resourceRequiredAmount[resourceID] * Globals.timeScale:
				canResearch = false
		if canResearch:
			for resourceID in currentResearch.resourceRequiredID.size():
				gameManager.GameResourceList[resourceID] -= currentResearch.resourceRequiredAmount[resourceID] * Globals.timeScale
			currentResearch.researchLeft -= 10 * Globals.timeScale
		$NinePatchRect/Info/VBoxContainer/ProgressBar.value = currentResearch.researchLeft
		if currentResearch.researchLeft <= 0:
			FinishResearch()
	if Input.is_action_just_pressed("OpenResearch"):
		var tween = create_tween()
		isOpen = !isOpen
		if isOpen:
			tween.tween_property(self,"scale", Vector2.ONE, .16).set_trans(Tween.TRANS_BOUNCE)
		else:
			tween.tween_property(self,"scale", Vector2.ZERO, .16).set_trans(Tween.TRANS_BOUNCE)

func FinishResearch():
	if currentResearch.functionToCall != null:
		Globals.call(currentResearch.functionToCall) 
	if currentResearch.isRepeatable:
		currentResearch.researchAmount *= 1.5
		currentResearch.researchLeft = currentResearch.researchAmount
	currentResearch.isResearching = false
		
	get_tree().get_first_node_in_group("GameManager").UnlockResearch(currentResearch.unlocksID)
	currentResearch = null
	
		
	pass

func _on_button_pressed() -> void:
	var tween = create_tween()
	isOpen = false
	tween.tween_property(self,"scale", Vector2.ZERO, .16).set_trans(Tween.TRANS_BOUNCE)
	pass # Replace with function body.
