extends Area2D

signal  player_entered
signal player_out



func _on_body_entered(body):
	player_entered.emit()


func _on_body_exited(body):
	player_out.emit()
