extends CanvasLayer

var green:Color = Color("6bbfa3")
var red:Color = Color("8f0003")

@onready var laser_label:Label = %Label
@onready var grenade_label:Label = %Label2
@onready var laser_icon:TextureRect = %TextureRect
@onready var grenade_icon:TextureRect = $GrenadeCounter/VBoxContainer/TextureRect2
@onready var health_bar:TextureProgressBar = $MarginContainer/TextureProgressBar


func _ready():
	Global.connect("stat_change",update_stat_text)
	update_stat_text() 
	
	

func update_laser_text():
	laser_label.text = str(Global.laser_amount)
	update_color(Global.laser_amount,laser_label,laser_icon)

func update_grenade_text():
	grenade_label.text = str(Global.grenade_amount)
	update_color(Global.grenade_amount,grenade_label,grenade_icon)

func update_health_text():
	health_bar.value = Global.health

func update_stat_text():
	update_laser_text()
	update_grenade_text()
	update_health_text()

func update_color(amount:int,label:Label,icon:TextureRect):
	if amount == 0 :
		label.modulate = red
		icon.modulate = red
	elif amount > 0:
		label.modulate = green
		icon.modulate = green
			
	
