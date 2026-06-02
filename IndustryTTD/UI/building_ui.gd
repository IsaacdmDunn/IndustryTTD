extends NinePatchRect
class_name BuildingUI
var mousedOver = true
var building: Building
@export var pm1: OptionButton
@export var pm2: OptionButton
@export var pm3: OptionButton

@export var inputTextContainer: VBoxContainer
@export var outputTextContainer: VBoxContainer
var gm: GameManager
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gm = get_tree().get_first_node_in_group("GameManager")
	$VBoxContainer/Label.text = building.buildingName
	$VBoxContainer/TextureRect.texture = building.buildingImage
	$VBoxContainer/Label2.text = building.buildingDescription
	
	initPMUI(pm1, building.currentProductionID, building.productionMethodID)
	initPMUI(pm2, building.currentProduction2ID, building.productionMethod2ID)
	initPMUI(pm3, building.currentProduction3ID, building.productionMethod3ID)
	
	
func initPMUI(pm: OptionButton, currPM: int, pmIDList):
	pm.clear()
	if pmIDList.size() > 0:
		pm.visible = true
		for pmID in pmIDList.size():
			pm.add_item(gm.ProductionMethods[pmIDList[pmID]].pmName,pmID)
	else:
		pm.visible = false
		
	pm.selected = building.currentProductionID
	
	UpdateIOText(pm, currPM, pmIDList)
	pass
	
func UpdateIOText(pm, currentProductionID, pmIDList):
	if pmIDList.size() > 0:
		for input in gm.ProductionMethods[pmIDList[currentProductionID]].itemInputID.size():
			$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/input/Label2.text += "\n" + gm.GameResourceName[gm.ProductionMethods[pmIDList[currentProductionID]].itemInputID[input]] + " : " + str(gm.ProductionMethods[pmIDList[currentProductionID]].itemInput[input])#gm.ProductionMethods[building.productionMethodID[building.currentProductionID]].itemInput[input])
		for output in gm.ProductionMethods[pmIDList[currentProductionID]].itemOutputID.size():
			$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/output/Label.text += "\n" + gm.GameResourceName[gm.ProductionMethods[pmIDList[currentProductionID]].itemOutputID[output]] + " : " + str(gm.ProductionMethods[pmIDList[currentProductionID]].itemOutput[output])#gm.ProductionMethods[building.productionMethodID[building.currentProductionID]].itemInput[input])
			
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()
		
	#if !mousedOver:
		#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#queue_free()
	pass


func _on_mouse_exited() -> void:
	mousedOver = false
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	mousedOver = true
	pass # Replace with function body.


func _on_button_pressed() -> void:
	queue_free()
	pass # Replace with function body.


func _on_production_method_dd_item_selected(index: int) -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/input/Label2.text = "Input"
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/output/Label.text = "Output"
	building.currentProductionID = building.productionMethodID[index]
	UpdateIOText(pm1, building.currentProductionID, building.productionMethodID)
	UpdateIOText(pm2, building.currentProduction2ID, building.productionMethod2ID)
	UpdateIOText(pm3, building.currentProduction3ID, building.productionMethod3ID)
	pass # Replace with function body.


func _on_production_method_dd_2_item_selected(index: int) -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/input/Label2.text = "Input"
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/output/Label.text = "Output"
	building.currentProduction2ID = building.productionMethod3ID[index]
	UpdateIOText(pm1, building.currentProductionID, building.productionMethodID)
	UpdateIOText(pm2, building.currentProduction2ID, building.productionMethod2ID)
	UpdateIOText(pm3, building.currentProduction3ID, building.productionMethod3ID)
	pass # Replace with function body.


func _on_production_method_dd_3_item_selected(index: int) -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/input/Label2.text = "Input"
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/output/Label.text = "Output"
	building.currentProduction3ID = building.productionMethod3ID[index]
	UpdateIOText(pm1, building.currentProductionID, building.productionMethodID)
	UpdateIOText(pm2, building.currentProduction2ID, building.productionMethod2ID)
	UpdateIOText(pm3, building.currentProduction3ID, building.productionMethod3ID)
	pass # Replace with function body.
