extends NinePatchRect
var research: Research
var mouseEntered: bool = false
var researchManager:ResearchManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	researchManager = get_tree().get_first_node_in_group("ResearchUI")
	$Control/TextureRect.texture = research.researchImage
	$Control/Header.text = research.researchName
	$Control/Header2.text = research.researchDescription
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !research.isResearching:
		$Control/Button.text = "Research"
	else:
		$Control/Button.text = "Cancel"
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		researchManager.UpdateLeftReseachUI(research)
	if !research.isUnlocked or research.researchLeft <= 0:

		visible = false
	else:
		visible = true
	pass


func _on_button_pressed() -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound()
	if $Control/Button.text == "Research":
		research.isResearching = true
		$Control/Button.text = "Cancel"
		researchManager.currentResearch = research
		
	else:
		$Control/Button.text = "Research"
		research.isResearching = false
		researchManager.currentResearch = null
		pass # Replace with function body.


func _on_mouse_entered() -> void:
	mouseEntered = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	mouseEntered = false
	pass # Replace with function body.
