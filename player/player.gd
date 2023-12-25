extends CharacterBody2D

signal laser(pos,direction)
signal grenade(pos,direction)

signal update_stat

var can_laser:bool = true
var can_grenade:bool = true



func hit():
	print('player was hit')

func _physics_process(_delta):
	
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	Global.player_pos = global_position
	
	#rotate
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser and Global.laser_amount > 0:
		Global.laser_amount-=1
		var laser_markers = $LaserStartPosition.get_children()
		$GPUParticles2D.emitting = true
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserReloadTimer.start()
		laser.emit(selected_marker.global_position,player_direction)
		
	if Input.is_action_pressed("secondary action") and can_grenade and Global.grenade_amount > 0:
		Global.grenade_amount-=1 
		var pos = $LaserStartPosition.get_children()[0].global_position
		can_grenade = false
		$GrenadeReloadTimer.start()
		
		grenade.emit(pos,player_direction)

func _on_laser_reload_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grenade = true
	
#func add_item(type)->void:
#	if type == "laser":
#		Global.laser_amount+=5
#	if	type == 'grenade':
#		Global.grenade_amount+=1
#	if type == 'health':
#		Global.health+=10
#	update_stat.emit()	
	
