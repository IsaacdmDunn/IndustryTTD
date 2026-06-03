extends Building
class_name Wall

@export var baseMaxHealth:float = 1000
@export var maxHealthMod:float = 1
@onready var currentHealth:float = baseMaxHealth
@export var repairRate:float = 1
@export var repairRateMod: float = 1
var isGameOver = false
func _physics_process(delta: float) -> void:
	if currentHealth < 0:
		isGameOver = true
		get_tree().get_first_node_in_group("GameUI").GameOverUIOpen()
		currentHealth = 0
	elif currentHealth > baseMaxHealth:
		currentHealth = baseMaxHealth
		UpdateHealthBar()
	repairRate = gm.ProductionMethods[productionMethodID[currentProductionID]].baseProductionRate * repairRate
	#$TowerTop.rotat
	if cooldown < 0 and gm.GameResourceList[0] > 0 and currentHealth > 0:
		ProduceResource()
		
		cooldown = repairRate
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
			#gm.GameResourceList[gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutputID[outputID]] += gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutput[outputID]
			currentHealth += gm.ProductionMethods[productionMethodID[currentProductionID]].itemOutput[outputID]
			UpdateHealthBar()
		pass
		
		
func TakeDamage(amount:float):
	currentHealth -= amount
	UpdateHealthBar()
	
func UpdateHealthBar():
	var bar:ProgressBar = get_tree().get_first_node_in_group("HealthBar")
	bar.max_value = baseMaxHealth
	bar.value = currentHealth
	bar.get_child(0).text = str(currentHealth) + "/" + str(baseMaxHealth)
