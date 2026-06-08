extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound()
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	Globals.timeScale = 0
	$"../..".PauseGame(false)
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	Globals.timeScale = .25
	$"../..".PauseGame(false)
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	Globals.timeScale = .5
	$"../..".PauseGame(false)
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	Globals.timeScale = 1
	$"../..".PauseGame(false)
	pass # Replace with function body.


func _on_button_5_pressed() -> void:
	get_tree().get_first_node_in_group("SoundManager").ButtonSound2()
	Globals.timeScale = 2
	$"../..".PauseGame(false)
	pass # Replace with function body.
