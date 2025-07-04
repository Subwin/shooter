extends CanvasLayer

var green: Color = Color("6bbfa3")
var red: Color = Color(0.9,0,0,1)

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var bomb_label: Label = $BombCounter/VBoxContainer2/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var bomb_icon: TextureRect = $BombCounter/VBoxContainer2/TextureRect
@onready var health_progress: TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready() -> void:
    Globals.connect("health_change", on_update_health_progress)
    Globals.connect("laser_amount_change", on_update_laser_label)
    Globals.connect("bomb_amount_change", on_update_bomb_label)
    
    on_update_laser_label()
    on_update_bomb_label()
    on_update_health_progress()
    
func on_update_laser_label():
    laser_label.text = str(Globals.laser_amount)
    update_color(Globals.laser_amount, laser_label, laser_icon)

func on_update_bomb_label():
    bomb_label.text = str(Globals.bomb_amount)
    update_color(Globals.bomb_amount, bomb_label, bomb_icon)
    
func on_update_health_progress():
    health_progress.value = Globals.health
    
func update_color(amount:int, label:Label, icon:TextureRect) -> void:
    if amount > 0:
        label.modulate = green
        icon.modulate = green
    else:
        label.modulate = red
        icon.modulate = red
        
    
    
