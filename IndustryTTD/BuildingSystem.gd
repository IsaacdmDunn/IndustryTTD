extends TileMapLayer
@onready var gameManager: GameManager = $".."
@onready var BuildingData: TileMapLayer = $BuildingData
@onready var BuildingContainer: Node2D = $"../BuildingContainer"


var currentBuildingOption = 1


func BuildMode():
	for x in 11:
		for y in 11:
			var tilePos = Vector2i(local_to_map(get_global_mouse_position()).x + x - 5, local_to_map(get_global_mouse_position()).y + y - 5)
			
			if BuildingData.get_cell_atlas_coords(tilePos) == Vector2i(0,0) or get_cell_atlas_coords(tilePos) == Vector2i(1,0) or get_cell_atlas_coords(tilePos) == null:
				set_cell(tilePos, 0, Vector2i(0,0),0)
				if x == 5 or x == 6:
					if y == 5 or y == 6:
						set_cell(tilePos, 0, Vector2i(1,0),0) 
			elif BuildingData.get_cell_atlas_coords(tilePos) == Vector2i(2,0):
				set_cell(tilePos, 0, Vector2i(2,0),0)
			else:
				set_cell(tilePos, 0, Vector2i(0,0),0)
			
			
	if Input.is_action_just_pressed("ui_accept"):
		var canBuild = true
		var currentBuildingResource: BuildingOption = gameManager.BuildingList[currentBuildingOption]
		var mousePos: Vector2i = get_global_mouse_position().snapped(Vector2i(gameManager.MapSize.x, gameManager.MapSize.y))
		
		for cost in currentBuildingResource.costAmount.size():
			if currentBuildingResource.costAmount[currentBuildingResource.costID[cost]] > gameManager.GameResourceList[currentBuildingResource.costID[cost]]:
				canBuild = false
				pass
				
		for x in gameManager.BuildingList[currentBuildingOption].buildingSize.x:
			for y in gameManager.BuildingList[currentBuildingOption].buildingSize.y:
				if BuildingData.get_cell_atlas_coords(local_to_map(mousePos) + Vector2i(x,y)) == Vector2i(2,0):
					canBuild = false
					break
					break
					
		if canBuild:
			var buildingToSpawn:Building = gameManager.BuildingList[currentBuildingOption].building.instantiate()
			buildingToSpawn.position = mousePos
			buildingToSpawn.buildingSize = gameManager.BuildingList[currentBuildingOption].buildingSize
			buildingToSpawn.buildingName = gameManager.BuildingList[currentBuildingOption].buildingName
			buildingToSpawn.buildingDescription = gameManager.BuildingList[currentBuildingOption].description
			buildingToSpawn.buildingImage = gameManager.BuildingList[currentBuildingOption].buildingImg
			BuildingContainer.add_child(buildingToSpawn)
			
			for x in buildingToSpawn.buildingSize.x:
				for y in buildingToSpawn.buildingSize.y:
					BuildingData.set_cell(local_to_map(buildingToSpawn.position) + Vector2i(x,y),0,Vector2i(2,0))
			
			for cost in currentBuildingResource.costAmount.size():
				gameManager.GameResourceList[currentBuildingResource.costID[cost]] -= currentBuildingResource.costAmount[currentBuildingResource.costID[cost]]
	pass
	
	


func _ready() -> void:
	for x in gameManager.MapSize.x:
		for y in gameManager.MapSize.y:
			BuildingData.set_cell(Vector2i(x,y),0,Vector2i(0,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	clear()
	if gameManager.currentGameState == gameManager.GameState.Build:
		BuildMode()
func DestroyBuilding(buildingSize: Vector2i, buildingPosition: Vector2):
	
	for x in buildingSize.x:
		for y in buildingSize.y:
			BuildingData.set_cell(local_to_map(buildingPosition) + Vector2i(x,y),0,Vector2i(0,0))
			
	pass
	
func MoveBuilding(buildingSize: Vector2i, buildingPosition: Vector2):
	
	pass
