extends NinePatchRect
class_name BuildingUITooltip
var building: BuildingOption

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var gm: GameManager = get_tree().get_first_node_in_group("GameManager")
	building = gm.BuildingList[0]
	$VBoxContainer/name.text = building.buildingName
	$VBoxContainer/desription.text = building.description
	$VBoxContainer/Cost.text = "Cost:"
	for costID in building.costID.size():
		$VBoxContainer/Cost.text = "\n" + str(gm.GameResourceName[building.costID[costID]]) + ": " + str(building.costAmount[costID])
	
	pass # Replace with function body.
func UpdateUI(_building: BuildingOption):
	#building = _building
	var gm: GameManager = get_tree().get_first_node_in_group("GameManager")
	$VBoxContainer/name.text = _building.buildingName
	$VBoxContainer/desription.text = _building.description
	$VBoxContainer/Cost.text = "Cost:"
	for costID in _building.costID.size():
		$VBoxContainer/Cost.text = "\n" + str(gm.GameResourceName[_building.costID[costID]]) + ": " + str(_building.costAmount[costID])
	
	pass
func SelectBuildingTooltip(_building):
	building = _building
	UpdateUI(building)
	
func ReturnToDefault():
	var gm: GameManager = get_tree().get_first_node_in_group("GameManager")
	$VBoxContainer/name.text = building.buildingName
	$VBoxContainer/desription.text = building.description
	$VBoxContainer/Cost.text = "Cost:"
	for costID in building.costID.size():
		$VBoxContainer/Cost.text = "\n" + str(gm.GameResourceName[building.costID[costID]]) + ": " + str(building.costAmount[costID])
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
