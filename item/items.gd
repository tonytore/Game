extends Area2D

var rotation_speed:int = 6

var options = ['laser','laser','laser','laser','grenade','health']
var type = options[randi()%len(options)]

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0,0,1)
	if type == 'grenade':
			$Sprite2D.modulate = Color(1,0,0)
	if type == 'health':
		$Sprite2D.modulate = Color(0,1,0)
		
		
func _process(delta):
	rotation = rotation_speed*delta


func _on_body_entered(body):
	body.add_item(type)
	queue_free()
