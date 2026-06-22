extends Resource
class_name SaveData

@export var kills:int = 0
@export var buildingCount:int = 0
@export var resourceMined:int = 0
@export var researchCount:int = 0

@export var waveID: int = 1
@export var resourceList: Array[int]
@export var resourceLimitList: Array[int]

#@export var buildings: Dictionary[int, float, Vector2] = {}
@export var buildings: Array[PackedScene] #issues
@export var enemies: Array[PackedScene]
@export var researchLeft: Array[float]
@export var isResearching: Array[bool]
@export var tilemapData: PackedScene

##globals
@export var enemyHealthMod: float = 1
@export var enemyHealthTemp: float = 0
@export var enemyDamageMod: float = 1
@export var enemyDamageTemp: float = 0
@export var enemySpeedMod: float = 1
@export var enemySpeedTemp: float = 0
@export var burnDamage = 3
@export var freezeAmount = .3


##save stuff to add
@export var researchSpeedMod: float = 1
