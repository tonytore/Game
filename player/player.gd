extends CharacterBody2D

signal laser(pos,direction)
signal grenade(pos,direction)

var can_laser:bool = true
var can_grenade:bool = true





func _physics_process(_delta):
	
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	
	#rotate
	look_at(get_global_mouse_position())
	
	
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPosition.get_children()
		$GPUParticles2D.emitting = true
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserReloadTimer.start()
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser.emit(selected_marker.global_position,player_direction)
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos = $LaserStartPosition.get_children()[0].global_position
		can_grenade = false
		$GrenadeReloadTimer.start()
		var player_direction = (get_global_mouse_position() - position).normalized()
		grenade.emit(pos,player_direction)

func _on_laser_reload_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grenade = true
