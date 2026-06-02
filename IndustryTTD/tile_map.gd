extends TileMap

var mapSize = Vector2i(5,5)
var Destination = Vector2i(2,2)
var tiles: Array[WorldTile]
var tilesToCheck: Array[int] = []
# Called when the node enters the scene tree for the first time.

func GetTileIDFromCoords(pos:Vector2i):
	return pos.x * mapSize.y + pos.y

func _ready() -> void:
	#makes tiles in grid
	for x in mapSize.x:
		for y in mapSize.y:
			#makes tile
			var worldTile: WorldTile = WorldTile.new()
			worldTile.coord = Vector2i(x,y)
			if x == Destination.x and y == Destination.y:
				#print(tiles.size())
				worldTile.isBFS = true
				worldTile.terrainCost = 0
				
			else:
				worldTile.isBFS = false
				#set_cell(0, Vector2i(x,y),0, Vector2i(1,1))
			tiles.append(worldTile)
	CostCalc()
	FlowCalc()
	
	print(tiles[19].terrainCost)
	print(tiles[20].terrainCost)
	print(tiles[21].terrainCost)
	print(tiles[22].terrainCost)
	print(tiles[23].terrainCost)
	print(tiles[24].terrainCost)
	Visuals()
	
	
	pass # Replace with function body.	

func Visuals():
	for x in mapSize.y :
		for y in mapSize.x:
			
			var tileID = GetTileIDFromCoords(Vector2i(x,y))
			
			
			
			if tiles[tileID].terrainCost == 0:
				set_cell(0, Vector2i(x,y),0, Vector2i(1,1))
			elif tiles[tileID].dir == Vector2i.LEFT:
				set_cell(0, Vector2i(x,y),0, Vector2i(0,1))
			elif tiles[tileID].dir == Vector2i.RIGHT:
				set_cell(0, Vector2i(x,y),0, Vector2i(2,1))
			elif tiles[tileID].dir == Vector2i.UP:
				set_cell(0, Vector2i(x,y),0, Vector2i(1,0))
			elif tiles[tileID].dir == Vector2i.DOWN:
				set_cell(0, Vector2i(x,y),0, Vector2i(1,2))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
func CostCalc():
	#get tileid from destination 
	var tileID = GetTileIDFromCoords(Destination)
	#print(tileID)
	tilesToCheck = SetAdjTilesCost(tileID)
	
	while tilesToCheck.size() > 0:
		var tilesToAdd = SetAdjTilesCost(tilesToCheck[0])
		tiles[tilesToCheck.front()].isBFS = true
		tilesToCheck.pop_front()
		for i in tilesToAdd:
			if !tiles[i].isBFS:
				tilesToCheck.append(i)
		#print(tilesToCheck)
	pass
func FlowCalc():
	for x in mapSize.x:
		for y in mapSize.y:
			var tileID = GetTileIDFromCoords(Vector2i(x,y))
			
			var AdjTiles = getAdjTiles(tiles[tileID].coord)
			var cheapestCell: WorldTile
			for i in AdjTiles.size():
				if i == 0:
					cheapestCell = tiles[AdjTiles[0]]
					
				if tiles[AdjTiles[i]].terrainCost < cheapestCell.terrainCost:
					cheapestCell = tiles[AdjTiles[i]]
			tiles[tileID].dir = cheapestCell.coord - tiles[tileID].coord
			if tileID == 20:
				#print(AdjTiles)
				pass
	pass
func SetAdjTilesCost(tileID: int):
	
	var adjTiles: Array[int]
	if tileID > mapSize.x: #up = id - layer
		if tiles[tileID - mapSize.x].isBFS == false:
			tiles[tileID - mapSize.x].terrainCost = tiles[tileID].terrainCost + 1
			adjTiles.append(tileID - mapSize.x)
	if tileID < (mapSize.x * mapSize.y) - mapSize.x:
		if !tiles[tileID + mapSize.x].isBFS:
			tiles[tileID + mapSize.x].terrainCost = tiles[tileID].terrainCost + 1
			adjTiles.append(tileID + mapSize.x)
	if tileID > 0: #more than 0 is left
		if tiles[tileID - 1].isBFS == false:
			tiles[tileID - 1].terrainCost = tiles[tileID].terrainCost + 1
			adjTiles.append(tileID - 1)
	if tileID < mapSize.x * mapSize.y - 1: #less than total tiles is right
		
		if tiles[tileID + 1].isBFS==false:
			tiles[tileID + 1].terrainCost = tiles[tileID].terrainCost + 1
			adjTiles.append(tileID + 1)
	return adjTiles


func getAdjTiles(tileCoord):
	var adjTiles: Array[int]
	if tileCoord.x > 0:
		adjTiles.append(GetTileIDFromCoords(tileCoord) - mapSize.y)
	if tileCoord.x < mapSize.y-1:
		adjTiles.append(GetTileIDFromCoords(tileCoord) + mapSize.y)
	if tileCoord.y > 0:
		adjTiles.append(GetTileIDFromCoords(tileCoord) - 1)
	if tileCoord.y < mapSize.x-1:
		adjTiles.append(GetTileIDFromCoords(tileCoord) + 1)
	return adjTiles
