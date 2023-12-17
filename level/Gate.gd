extends StaticBody2D

signal player_crossed_gate

func _on_area_2d_body_entered(_body):
	player_crossed_gate.emit()
