extends CanvasLayer

@onready var default_laser_amount:Label = %Label
@onready var default_grenade_amount:Label = $GrenadeCounter/VBoxContainer/Label2
func update_laser_text():
	default_laser_amount.text = str(Global.laser_amount) 

func update_grenade_text():
	default_grenade_amount.text = str(Global.grenade_amount) 
