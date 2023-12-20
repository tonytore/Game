extends LevelParent


func _on_gate_player_crossed_gate():
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,0.5)
	TransitionLayer.change_scene("res://scene/level/insides.tscn")
