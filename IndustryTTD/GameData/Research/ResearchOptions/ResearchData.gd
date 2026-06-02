extends Resource
class_name Research
@export var researchName: String
@export var researchImage: Texture2D
@export var researchDescription: String
@export var researchID: int = -1
@export var unlocksID: Array[int]
@export var researchAmount:float = 1000
var researchLeft: float = 1000
@export var isRepeatable: bool = false
@export var isUnlocked: bool = true
@export var resourceRequiredID: Array[int]
@export var resourceRequiredAmount: Array[int]
@export var functionToCall: String
var isResearching = false
