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
var inputText = "Input"
var outputText = "Output"

#set initial data and production method options
func _ready() -> void:
	gm = get_tree().get_first_node_in_group("GameManager")
	$Label.text = building.buildingName
	$VBoxContainer/TextureRect.texture = building.buildingImage
	$VBoxContainer/Label2.text = building.buildingDescription + building.extraDetails
	
	initPMUI(pm1, building.currentProductionID, building.productionMethodID)
	initPMUI(pm2, building.currentProduction2ID, building.productionMethod2ID)
	initPMUI(pm3, building.currentProduction3ID, building.productionMethod3ID)
	
#populates drop down menu with production method options
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
	
#updates input/ output text to show what resources the building needs
func UpdateIOText(pm, currentProductionID, pmIDList):
	#$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/output/Label.clear()
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/output/Label.clear()
	
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/input/Label2.clear()
	
	if pmIDList.size() > 0:
		for input in gm.ProductionMethods[pmIDList[currentProductionID]].itemInputID.size():
			inputText += "\n" + "[img]" + gm.GameResourceIcon[gm.ProductionMethods[pmIDList[currentProductionID]].itemInputID[input]]  + "[/img]" + " " +  str(gm.ProductionMethods[pmIDList[currentProductionID]].itemInput[input])
		for output in gm.ProductionMethods[pmIDList[currentProductionID]].itemOutputID.size():
			outputText +="\n" + "[img]" + gm.GameResourceIcon[gm.ProductionMethods[pmIDList[currentProductionID]].itemOutputID[output]]  + "[/img]" + " " + str(gm.ProductionMethods[pmIDList[currentProductionID]].itemOutput[output])
	
	
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/input/Label2.append_text(inputText)
	$VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/output/Label.append_text(outputText)
	pass	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#closes UI
	if Input.is_action_just_pressed("ui_cancel"):# or (!mousedOver and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		queue_free()
	
	pass


func _on_mouse_exited() -> void:
	mousedOver = false
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	mousedOver = true
	pass # Replace with function body.

#on close button pressed
func _on_button_pressed() -> void:
	queue_free()
	pass # Replace with function body.

#change pm 1
func _on_production_method_dd_item_selected(index: int) -> void:
	inputText= "Input" 
	outputText= "Ouput" 
	
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	building.currentProductionID = building.productionMethodID[index]
	UpdateIOText(pm1, building.currentProductionID, building.productionMethodID)
	UpdateIOText(pm2, building.currentProduction2ID, building.productionMethod2ID)
	UpdateIOText(pm3, building.currentProduction3ID, building.productionMethod3ID)
	building.AddAdditionInfo()
	$VBoxContainer/Label2.text = building.buildingDescription + building.extraDetails
	
	pass # Replace with function body.

#change pm 2
func _on_production_method_dd_2_item_selected(index: int) -> void:
	inputText= "Input" 
	outputText= "Ouput" 
	
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	building.currentProduction2ID = building.productionMethod2ID[index]
	UpdateIOText(pm1, building.currentProductionID, building.productionMethodID)
	UpdateIOText(pm2, building.currentProduction2ID, building.productionMethod2ID)
	UpdateIOText(pm3, building.currentProduction3ID, building.productionMethod3ID)
	building.AddAdditionInfo()
	$VBoxContainer/Label2.text = building.buildingDescription + building.extraDetails
	
	pass # Replace with function body.

#change pm 3
func _on_production_method_dd_3_item_selected(index: int) -> void:
	inputText= "Input" 
	outputText= "Ouput" 
	
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	
	building.currentProduction3ID = building.productionMethod3ID[index]
	UpdateIOText(pm1, building.currentProductionID, building.productionMethodID)
	UpdateIOText(pm2, building.currentProduction2ID, building.productionMethod2ID)
	UpdateIOText(pm3, building.currentProduction3ID, building.productionMethod3ID)
	
	building.AddAdditionInfo()
	$VBoxContainer/Label2.text = building.buildingDescription + building.extraDetails
	
	pass # Replace with function body.


func _on_destoy_building_pressed() -> void:
	building.DestroyBuilding()
	queue_free()
	pass # Replace with function body.
