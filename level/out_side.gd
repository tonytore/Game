extends LevelParent 


func _on_gate_player_crossed_gate():
#	var tween = create_tween()
#	tween.tween_property($Player,"speed",0,0.5)
	TransitionLayer.change_scene("res://scene/level/insides.tscn")


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(1,1),1)


func _on_house_player_out():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(0.6,0.6),1)

	
