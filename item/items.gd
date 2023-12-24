extends Area2D

var rotation_speed:int = 6

var options = ['laser','laser','laser','laser','grenade','health']
var type = options[randi()%len(options)]

var direction: Vector2
var distance:int = randi_range(150,250)

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0,0,1)
	if type == 'grenade':
			$Sprite2D.modulate = Color(1,0,0)
	if type == 'health':
		$Sprite2D.modulate = Color(0,1,0)
		
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.tween_property(self,"position",target_pos,0.5)
		
func _process(delta):
	rotation = rotation_speed*delta


func _on_body_entered(_body):
	if type == "laser":
		Global.laser_amount+=5
	if	type == 'grenade':
		Global.grenade_amount+=1
	if type == 'health':
		Global.health+=10
	queue_free()
