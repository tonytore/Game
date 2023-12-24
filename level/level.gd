extends Node2D
class_name LevelParent

var laser_scene:PackedScene = preload("res://scene/projectile/laser.tscn")
var grenade_scene:PackedScene = preload("res://scene/projectile/grenade.tscn")
var item_scene:PackedScene = preload("res://scene/item/items.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group('Container'):  
		container.connect("open",_on_container_opened)
		
	for scout in get_tree().get_nodes_in_group('Scout'):
		scout.connect("laser",_on_scout_laser)


func _on_scout_laser(pos,direction):
	create_laser(pos,direction)	


func _on_container_opened(pos ,direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$ItemStore.call_deferred("add_child",item)
	
func create_laser(pos,direction):
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
	$UI.update_laser_text()
	

func _on_player_laser(pos,direction):  
	create_laser(pos,direction)
	
func _on_player_grenade(pos,direction):
#	print('shoot grenade from level')
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
#	grenade.linear_velocity = Vector2.UP*grenade.speed
	grenade.linear_velocity = direction*grenade.speed
	$Projectile.add_child(grenade)
	$UI.update_grenade_text()




func _on_player_update_stat():
	$UI.update_laser_text()
	$UI.update_grenade_text()
