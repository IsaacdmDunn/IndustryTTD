extends Resource
class_name LevelData
@export var levelID:int = 0
@export var levelName: String = "Default Name"
@export var waveLength: int = 80
@export var levelSize: Vector2i = Vector2i(128,128)
@export var levelImg: Texture2D
#starting buildings
@export var levelScene: PackedScene
@export var StartingGameResourceList: Array[int] = [500, 300, 300, 20, 0,0,0,0,0]
@export var StartingGameResourceLimit: Array[int] = [500, 500, 500, 100, 100,100,100,100,100]
@export var plays:int = 0
@export var wins: int = 0
@export var highestWave: int = 0
