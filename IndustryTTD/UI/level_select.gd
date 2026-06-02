extends NinePatchRect
@export var levelList: Array[LevelData]
@export var levelOptionPrefab: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in levelList:
		var levelUIToAdd = levelOptionPrefab.instantiate()
		levelUIToAdd.levelData = level
		$ScrollContainer/VBoxContainer.add_child(levelUIToAdd)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
