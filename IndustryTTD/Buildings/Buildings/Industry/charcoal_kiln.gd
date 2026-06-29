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
		productionRate * Globals.coalSpeedMod
	cooldown -= delta * Globals.timeScale
	pass

func IOProduce(_productionMethodID, _currentProductionID):
	for inputID in gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemInput.size():
		gm.GameResourceList[gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemInputID[inputID]] -= gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemInput[inputID]
				
	for outputID in gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput.size():
		gm.GameResourceList[gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutputID[outputID]] += gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput[outputID] * Globals.coalAmountMod
		SaveSystem.saveData.resourceMined += gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput[outputID]
		var popupToAdd = popupIcon.instantiate()
		popupToAdd.data = "[img]" + gm.GameResourceIcon[gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutputID[outputID]]  + "[/img]" + " " + str(gm.ProductionMethods[_productionMethodID[_currentProductionID]].itemOutput[outputID])
		$VBoxContainer.add_child(popupToAdd)
		pass
