extends Control
@export var BuildingOptionPrefab:PackedScene
var buildingData
@onready var optionContainer = $NinePatchRect/ScrollContainer/HBoxContainer
var optionTypeID = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buildingData = get_tree().get_first_node_in_group("GameManager").BuildingList
	for building in buildingData.size():
		var UIToAdd: BuildingOptionUI = BuildingOptionPrefab.instantiate()
		UIToAdd.buildingID = building
		UIToAdd.buildingType = buildingData[building].buildingType
		UIToAdd.get_child(0).texture = buildingData[building].buildingImg
		UIToAdd.get_child(1).text = buildingData[building].buildingName
		optionContainer.add_child(UIToAdd)
	UpdateOptions()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
func UpdateOptions():
	for option: BuildingOptionUI in optionContainer.get_children():
		if option.buildingType == optionTypeID:
			option.visible = true
		else:
			option.visible = false

func _on_tab_bar_tab_changed(tab: int) -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	optionTypeID = tab
	UpdateOptions()
	pass # Replace with function body.
