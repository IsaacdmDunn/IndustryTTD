extends Control
var data = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.append_text(data)
	var tween1 = create_tween()
	var tween2 = create_tween()
	#tween2.tween_property($RichTextLabel, "position", Vector2.ONE, 1)
	
	tween1.tween_property($RichTextLabel, "scale", Vector2.ONE, .64).set_trans(Tween.TRANS_ELASTIC)
	tween1.tween_property($RichTextLabel, "scale", Vector2.ZERO, .32).set_trans(Tween.TRANS_ELASTIC)
	
	pass # Replace with function body.





func _on_timer_timeout() -> void:
	queue_free()
	
	pass # Replace with function body.
