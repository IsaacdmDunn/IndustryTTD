extends Resource
class_name SaveData

@export var waveID: int = 1
@export var resourceList: Array[int]
@export var resourceLimitList: Array[int]

#@export var buildings: Dictionary[int, float, Vector2] = {}
@export var buildings: Array[PackedScene] #issues
@export var enemies: Array[PackedScene]
@export var research: Array[Research]
@export var tilemapData: PackedScene
