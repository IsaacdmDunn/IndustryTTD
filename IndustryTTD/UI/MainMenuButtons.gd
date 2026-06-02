extends Button

func TweenButton(isEntered):
	var ButtonTween = create_tween()
	var buttonPosTween = create_tween()
	if isEntered:
		ButtonTween.tween_property(self, "scale", Vector2(1.15, 1.15),.2).set_trans(Tween.TRANS_BOUNCE)
		buttonPosTween.tween_property(self, "position", Vector2(-50, position.y),.2).set_trans(Tween.TRANS_BOUNCE)
	else:
		ButtonTween.tween_property(self, "scale", Vector2(1, 1),.2).set_trans(Tween.TRANS_BOUNCE)
		buttonPosTween.tween_property(self, "position", Vector2(0, position.y),.2).set_trans(Tween.TRANS_BOUNCE)
	
	pass



func _on_mouse_entered() -> void:
	TweenButton(true)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	TweenButton(false)
	pass # Replace with function body.
