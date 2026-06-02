extends Resource
class_name WaveData

@export var enemyCount: Curve #x axis represents wave y is enemy count
@export var enemyPerSecond: Curve #y axis represents 
@export var enemiesList: Array[PackedScene]
@export var numberOfEnemyTypes: Curve
@export var enemiesRatio: Array[int]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
