extends Building

func _physics_process(delta: float) -> void:
	#open buildingUI
	if selected and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_tree().get_first_node_in_group("GameUI").OpenBuildingUI(self)
		get_tree().get_first_node_in_group("SoundManager").ButtonSound()
	
	#run production method
	if cooldown < 0:
		ProduceResource()
		cooldown = productionRate
	cooldown -= delta * Globals.timeScale
	pass
#produces resources
func ProduceResource():
	var canProduce: bool = true
	productionRate = gm.ProductionMethods[productionMethodID[currentProductionID]].baseProductionRate
	productionRate += gm.ProductionMethods[productionMethod2ID[currentProduction2ID]].baseProductionRate
	productionRate += gm.ProductionMethods[productionMethod3ID[currentProduction3ID]].baseProductionRate
	
	AddAdditionInfo()
	#check can produce
	for inputID in gm.ProductionMethods[productionMethodID[currentProductionID]].itemInput.size():
		#if resources for pm are not available then cant make resource
		if gm.GameResourceList[gm.ProductionMethods[productionMethodID[currentProductionID]].itemInputID[inputID]] < gm.ProductionMethods[productionMethodID[currentProductionID]].itemInput[inputID]:
			canProduce = false
			pass
	for inputID in gm.ProductionMethods[productionMethod2ID[currentProduction2ID]].itemInput.size():
		#if resources for pm are not available then cant make resource
		if gm.GameResourceList[gm.ProductionMethods[productionMethod2ID[currentProduction2ID]].itemInputID[inputID]] < gm.ProductionMethods[productionMethod2ID[currentProduction2ID]].itemInput[inputID]:
			canProduce = false
			pass
	for inputID in gm.ProductionMethods[productionMethod3ID[currentProduction3ID]].itemInput.size():
		#if resources for pm are not available then cant make resource
		if gm.GameResourceList[gm.ProductionMethods[productionMethod3ID[currentProduction3ID]].itemInputID[inputID]] < gm.ProductionMethods[productionMethod3ID[currentProduction3ID]].itemInput[inputID]:
			canProduce = false
			pass
	#if can produce check each input and output and add and remove resources
	if canProduce:	
		IOProduce(productionMethodID, currentProductionID)
		IOProduce(productionMethod2ID, currentProduction2ID)
		IOProduce(productionMethod3ID, currentProduction3ID)
		
		pass

func IOProduce(_productionMethodID, _currentProductionID):
	for inputID in gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemInput.size():
		gm.GameResourceList[gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemInputID[inputID]] -= gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemInput[inputID]
				
	for outputID in gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput.size():
		gm.GameResourceList[gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutputID[outputID]] += gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput[outputID] + Globals.houseCapMod
		SaveSystem.saveData.resourceMined += gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput[outputID] 
		var popupToAdd = popupIcon.instantiate()
		popupToAdd.data = "[img]" + gm.GameResourceIcon[gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutputID[outputID]]  + "[/img]" + " " + str(gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput[outputID])
		$VBoxContainer.add_child(popupToAdd)
		pass
