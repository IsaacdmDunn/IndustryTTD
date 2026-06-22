extends Node
class_name GameManager
enum GameResourceTypes {Wood, Stone, Food, Pop, Charcoal, Metal, Niter}
@export var GameResourceList: Array[int] = [1000, 1000, 100, 20, 0,0,0,0,0]
@export var GameResourceLimit: Array[int] = [1000, 1000, 500, 20, 200,200,200,200,100]
@export var GameResourceName: Array[String] = ["Wood", "Stone", "Food", "People", "Charcoal", "Metal", "Tools", "Niter"]
@export var GameResourceIcon: Array[String] = ["res://Sprites/ResourceIcons/Wood.png","res://Sprites/ResourceIcons/Stone.png","res://Sprites/ResourceIcons/Food.png","res://Sprites/ResourceIcons/Person.png","res://Sprites/ResourceIcons/Charcoal.png","res://Sprites/ResourceIcons/Metal.png","res://Sprites/ResourceIcons/Tools.png","res://Sprites/ResourceIcons/Niter.png"]

@export var BuildingList: Array[BuildingOption]
@export var ProductionMethods: Array[ProductionMethod]
@export var ResearchList: Array[Research]
@export var MapSize: Vector2i = Vector2i(64,32)

enum GameState {Game, Pause, Build, Loading, GameOver}
var currentGameState = GameState.Game

func UnlockResearch(list: Array[int]):
	for i in list:
		ResearchList[i].isUnlocked = true
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.openFromSave:
		SaveSystem.LoadSave()
		if SaveSystem.saveData != null:
			$Path2D.currentWave = SaveSystem.saveData.waveID
			$Path2D.currentWave-=1#stops next wave on reload bug
			
			$BuildingContainer.get_child(0).queue_free()
			for building in SaveSystem.saveData.buildings:
				var buildingToLoad = building.instantiate()
				print(buildingToLoad)
				$BuildingContainer.add_child(buildingToLoad)
				
			for enemy in SaveSystem.saveData.enemies:
				var enemyToLoad = enemy.instantiate()
				print(enemyToLoad)
				$Path2D.add_child(enemyToLoad)
			var tiles: TileMapLayer =  SaveSystem.saveData.tilemapData.instantiate()
			for cell in tiles.get_used_cells():
				$BuildingTiles/BuildingData.set_cell(cell, 0, tiles.get_cell_atlas_coords(cell))
			GameResourceList = SaveSystem.saveData.resourceList
			GameResourceLimit = SaveSystem.saveData.resourceLimitList
			#ResearchList = SaveSystem.saveData.research
			for i in SaveSystem.saveData.researchLeft.size():
				print(i)
				ResearchList[i].researchLeft = SaveSystem.saveData.researchLeft[i]
				ResearchList[i].isResearching = SaveSystem.saveData.isResearching[i]
	$Path2D.GetNextWave()
	pass # Replace with function body.


func SetSaveData():
	#SaveSystem.saveData = SaveData.new()
	SaveSystem.saveData.resourceList = GameResourceList
	SaveSystem.saveData.resourceLimitList = GameResourceLimit
	for research in ResearchList.size():
		SaveSystem.saveData.researchLeft.append(ResearchList[research].researchLeft)
		SaveSystem.saveData.isResearching.append(ResearchList[research].isResearching)
	print(ResearchList[0].researchLeft)
	for building in $BuildingContainer.get_children():
		var buildingToSave = PackedScene.new()
		buildingToSave.pack(building)
		SaveSystem.saveData.buildings.append(buildingToSave)
	for enemy in $Path2D.get_children():
		var enemyToSave = PackedScene.new()
		enemyToSave.pack(enemy)
		SaveSystem.saveData.enemies.append(enemyToSave)
	var tiles = PackedScene.new()
	tiles.pack($BuildingTiles/BuildingData)
	SaveSystem.saveData.tilemapData = tiles
	##globals
	SaveSystem.saveData.enemyHealthMod = Globals.enemyHealthMod
	SaveSystem.saveData.enemyHealthTemp = Globals.enemyHealthTemp
	SaveSystem.saveData.enemyDamageMod = Globals.enemyDamageMod
	SaveSystem.saveData.enemyDamageTemp = Globals.enemyDamageTemp
	SaveSystem.saveData.enemySpeedMod = Globals.enemySpeedMod
	SaveSystem.saveData.enemySpeedTemp = Globals.enemySpeedTemp
	SaveSystem.saveData.burnDamage = Globals.burnDamage
	SaveSystem.saveData.freezeAmount = Globals.freezeAmount
	
	
	
	
	SaveSystem.WriteSave()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#check resource limit
	for i in GameResourceList.size():
		if GameResourceList[i] > GameResourceLimit[i]:
			GameResourceList[i] = GameResourceLimit[i]
	pass
