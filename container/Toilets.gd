extends ItemContainer

func hit():
	if not opened:
		$LidSprite.hide()
#		$AudioStreamPlayer2D.play()
		var pos = $SpawnPosition.get_child(randi()%$SpawnPosition.get_child_count()).global_position
		open.emit(pos, current_direction)
		opened = true
