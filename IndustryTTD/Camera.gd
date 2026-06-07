extends Camera2D

var inBuildingArea = false
@export var buildingArea: Vector2
@onready var pathArea: Vector2 = position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#moves between camera moves
	if Input.is_action_just_pressed("MoveRight") and !inBuildingArea:
		inBuildingArea = true
		var tween = create_tween()
		tween.tween_property(self, "position", buildingArea, .6).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	elif Input.is_action_just_pressed("MoveLeft") and inBuildingArea:
		inBuildingArea = false
		var tween = create_tween()
		tween.tween_property(self, "position", pathArea, .6).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	pass


func _on_move_cam_right_pressed() -> void:
	$CanvasLayer/MoveCamRight.disabled = true
	$CanvasLayer/MoveCamRight.visible = false
	$CanvasLayer/MoveCamLeft.disabled = false
	$CanvasLayer/MoveCamLeft.visible = true
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	inBuildingArea = true
	var tween = create_tween()
	tween.tween_property(self, "position", buildingArea, .6).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	
	pass # Replace with function body.


func _on_move_cam_left_pressed() -> void:
	$CanvasLayer/MoveCamRight.disabled = false
	$CanvasLayer/MoveCamRight.visible = true
	$CanvasLayer/MoveCamLeft.disabled = true
	$CanvasLayer/MoveCamLeft.visible = false
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	inBuildingArea = false
	var tween = create_tween()
	tween.tween_property(self, "position", pathArea, .6).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	
	pass # Replace with function body.
