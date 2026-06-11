extends CharacterBody2D
class_name Building
@export var buildingSize: Vector2i = Vector2i(2,2)
var buildingID = -1
var buildingName: String
var buildingImage: Texture2D
var buildingDescription: String
var extraDetails: String
var buildingData: BuildingOption
var selected: bool = false
@export var productionMethodID: Array[int]
@export var productionMethod2ID: Array[int]
@export var productionMethod3ID: Array[int]
var currentProductionID = 0
var currentProduction2ID = 0
var currentProduction3ID = 0
var cooldown = .2
var productionRate= 1
var gm: GameManager
@export var popupIcon: PackedScene

func _ready() -> void:
	gm = get_tree().get_first_node_in_group("GameManager")
	AddAdditionInfo()

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
	AddAdditionInfo()
	#check can produce
	for inputID in gm.ProductionMethods[productionMethodID[currentProductionID]].itemInput.size():
		#if resources for pm are not available then cant make resource
		if gm.GameResourceList[gm.ProductionMethods[productionMethodID[currentProductionID]].itemInputID[inputID]] < gm.ProductionMethods[productionMethodID[currentProductionID]].itemInput[inputID]:
			canProduce = false
			pass
	#if can produce check each input and output and add and remove resources
	if canProduce:	
		for inputID in gm.ProductionMethods[productionMethodID[currentProductionID]].itemInput.size():
			gm.GameResourceList[gm.ProductionMethods[productionMethodID[currentProductionID]].itemInputID[inputID]] -= gm.ProductionMethods[productionMethodID[currentProductionID]].itemInput[inputID]
				
		for outputID in gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutput.size():
			gm.GameResourceList[gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutputID[outputID]] += gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutput[outputID]
			SaveSystem.saveData.resourceMined += gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutput[outputID]
			var popupToAdd = popupIcon.instantiate()
			popupToAdd.data = "[img]" + gm.GameResourceIcon[gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutputID[outputID]]  + "[/img]" + " " + str(gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutput[outputID])
			$VBoxContainer.add_child(popupToAdd)
		pass

#stops hover over effect disallows building to be selected
func _on_area_2d_mouse_exited() -> void:
	#undraw range circle
	queue_redraw()
	
	
	var sizeTween: Tween = create_tween()
	sizeTween.tween_property($Sprite2D, "scale", Vector2(1,1), .3).set_trans(Tween.TRANS_BOUNCE)
	
	selected = false
	pass # Replace with function body.

#hover over effect allows building to be selected
func _on_area_2d_mouse_entered() -> void:
	
	#draw range circle
	queue_redraw()
	
	var sizeTween: Tween = create_tween()
	sizeTween.tween_property($Sprite2D, "scale", Vector2(1.16,1.16), .2).set_trans(Tween.TRANS_BOUNCE)
	
	selected = true
	pass # Replace with function body.

#destroys building when deleted
func DestroyBuilding():
	get_tree().get_first_node_in_group("BuildingData").DestroyBuilding(buildingSize, position)
	
	##removing unbuildable tiles
	
	queue_free()
	pass

#moves building to new position
func MoveBuilding():
	get_tree().get_first_node_in_group("BuildingData").MoveBuilding(buildingSize, position)
	pass


func AddAdditionInfo():
	extraDetails = "\nProduction Rate: " + str(gm.ProductionMethods[productionMethodID[currentProductionID]].baseProductionRate)
	pass
