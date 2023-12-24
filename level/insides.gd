extends LevelParent


func _on_node_2d_body_entered(_body):
#		var tween = create_tween()
#		tween.tween_property($Player,"speed",0,0.5)
		TransitionLayer.change_scene("res://scene/level/out_side.tscn")
