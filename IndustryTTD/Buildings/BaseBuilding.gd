extends CharacterBody2D
class_name Building
@export var buildingSize: Vector2i = Vector2i(2,2)
var buildingName: String
var buildingImage: Texture2D
var buildingDescription: String
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


func _ready() -> void:
	gm = get_tree().get_first_node_in_group("GameManager")


func _physics_process(delta: float) -> void:
	if selected and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_tree().get_first_node_in_group("GameUI").OpenBuildingUI(self)
	
	
	#run production method
	if cooldown < 0:
		ProduceResource()
	cooldown -= delta * Globals.timeScale
	pass
#produces resources
func ProduceResource():
	var canProduce: bool = true
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
		pass


func _on_area_2d_mouse_exited() -> void:
	var sizeTween: Tween = create_tween()
	sizeTween.tween_property($Sprite2D, "scale", Vector2(1,1), .3).set_trans(Tween.TRANS_BOUNCE)
	
	selected = false
	pass # Replace with function body.


func _on_area_2d_mouse_entered() -> void:
	var sizeTween: Tween = create_tween()
	sizeTween.tween_property($Sprite2D, "scale", Vector2(1.16,1.16), .2).set_trans(Tween.TRANS_BOUNCE)
	
	selected = true
	pass # Replace with function body.

func DestroyBuilding():
	get_tree().get_first_node_in_group("BuildingData").DestroyBuilding(buildingSize, position)
	queue_free()
	pass
	
func MoveBuilding():
	get_tree().get_first_node_in_group("BuildingData").MoveBuilding(buildingSize, position)
	pass


func _on_mouse_entered() -> void:
	pass # Replace with function body.
