extends Node2D
class_name  LevelParent

var laser_scene:PackedScene = preload("res://scene/projectile/laser.tscn")
var grenade_scene:PackedScene = preload("res://scene/projectile/grenade.tscn")


func _on_player_laser(pos,direction):  
	
	# instance the laser
	var laser = laser_scene.instantiate() as Area2D
	
	#update the laser position
	laser.position = pos
	
	#rotate player to the right
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	
	#we have to move the laser
	#laser.directions = Vector2.RIGHT
	laser.direction  = direction
	
	# add the instantiated laser to a node2D
	$Projectile.add_child(laser)


func _on_player_grenade(pos,direction):
#	print('shoot grenade from level')
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
#	grenade.linear_velocity = Vector2.UP*grenade.speed
	grenade.linear_velocity = direction*grenade.speed
	$Projectile.add_child(grenade)







	


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(1,1),1)


func _on_house_player_out():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(0.6,0.6),1)
