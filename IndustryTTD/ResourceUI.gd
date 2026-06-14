extends NinePatchRect
@export var labelList: VBoxContainer
var gm: GameManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gm = get_tree().get_first_node_in_group("GameManager")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$LabelList/Wood.text = ""
	$LabelList/Stone.text = ""
	$LabelList/Food.text = ""
	$LabelList/Pop.text = ""
	$LabelList2/Iron.text = ""
	$LabelList2/Tools.text = ""
	$LabelList2/Coal.text = ""
	$LabelList2/Niter.text = ""
	
	
	$LabelList/Wood.append_text("[img]" + gm.GameResourceIcon[0] + "[/img]" + " " + str(gm.GameResourceList[0]) + " / " + str(gm.GameResourceLimit[0]))
	$LabelList/Stone.append_text("[img]" + gm.GameResourceIcon[1] + "[/img]" + " " + str(gm.GameResourceList[1]) + " / " + str(gm.GameResourceLimit[1]))
	$LabelList/Food.append_text("[img]" + gm.GameResourceIcon[2] + "[/img]" + " " + str(gm.GameResourceList[2]) + " / " + str(gm.GameResourceLimit[2]))
	$LabelList/Pop.append_text("[img]" + gm.GameResourceIcon[3] + "[/img]" + " " + str(gm.GameResourceList[3]) + " / " + str(gm.GameResourceLimit[3]))
	$LabelList2/Iron.append_text("[img]" + gm.GameResourceIcon[5] + "[/img]" + " " + str(gm.GameResourceList[5]) + " / " + str(gm.GameResourceLimit[5]))
	$LabelList2/Tools.append_text("[img]" + gm.GameResourceIcon[6] + "[/img]" + " " + str(gm.GameResourceList[6]) + " / " + str(gm.GameResourceLimit[6]))
	$LabelList2/Coal.append_text("[img]" + gm.GameResourceIcon[4] + "[/img]" + " " + str(gm.GameResourceList[4]) + " / " + str(gm.GameResourceLimit[4]))
	$LabelList2/Niter.append_text("[img]" + gm.GameResourceIcon[7] + "[/img]" + " " + str(gm.GameResourceList[7]) + " / " + str(gm.GameResourceLimit[7]))
	pass
