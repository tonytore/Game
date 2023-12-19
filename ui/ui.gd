extends CanvasLayer

@onready var default_laser_amount:Label = %Label

func update_laser_text():
	default_laser_amount.text = str(Global.laser_amount) 
