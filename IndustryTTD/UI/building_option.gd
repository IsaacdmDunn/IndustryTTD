extends NinePatchRect
class_name BuildingOptionUI
var buildingID
var mouseEntered
enum BuildingType {Tower, Resource, Industry, Other}
var buildingType = BuildingType.Tower
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseEntered:
		get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
		get_tree().get_first_node_in_group("BuildingData").currentBuildingOption = buildingID
		get_tree().get_first_node_in_group("BuildingUITooltip").SelectBuildingTooltip(get_tree().get_first_node_in_group("GameManager").BuildingList[buildingID])
	pass


func _on_mouse_entered() -> void:
	mouseEntered = true
	get_tree().get_first_node_in_group("BuildingUITooltip").UpdateUI(get_tree().get_first_node_in_group("GameManager").BuildingList[buildingID])
		
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	get_tree().get_first_node_in_group("BuildingUITooltip").ReturnToDefault()
	mouseEntered = false
	pass # Replace with function body.
