extends NinePatchRect
@export var labelList: VBoxContainer
var gm: GameManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gm = get_tree().get_first_node_in_group("GameManager")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$LabelList/Wood.text = "Wood: " + str(gm.GameResourceList[0]) + " / " + str(gm.GameResourceLimit[0])
	$LabelList/Stone.text = "Stone: " + str(gm.GameResourceList[1]) + " / " + str(gm.GameResourceLimit[1])
	$LabelList/Food.text = "Food: " + str(gm.GameResourceList[2]) + " / " + str(gm.GameResourceLimit[2])
	
	pass
