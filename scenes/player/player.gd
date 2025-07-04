extends CharacterBody2D

signal shoot_laser(pos, direction)
signal shoot_bomer(pos, direction)

var can_laser = true
var can_bomer = true
@export var speed = 600

func _process(delta: float) -> void:
    var dirction = Input.get_vector("left", "right", "up", "down")
    velocity = dirction * speed
    move_and_slide()
    
    look_at(get_global_mouse_position())
    
    if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
        Globals.laser_amount -= 1
        can_laser = false
        $LaserTimer.start()
        
        var laser_markers = $LaserStartPositions.get_children()
        var selected_marker = laser_markers[randi() % laser_markers.size()]
        var laser_directon =(get_global_mouse_position() - position).normalized()
        shoot_laser.emit(selected_marker.global_position, laser_directon)
        
    if Input.is_action_pressed("secondary action") and can_bomer and Globals.bomb_amount:
        Globals.bomb_amount -= 1
        can_bomer = false
        $BomerTimer.start()
        
        var bomer_markers = $LaserStartPositions.get_children()
        var selected_marker = bomer_markers[randi() % bomer_markers.size()]
        var bomer_directon =(get_global_mouse_position() - position).normalized()
        shoot_bomer.emit(selected_marker.global_position, bomer_directon)
        

func _on_laser_timer_timeout() -> void:
    can_laser = true

func _on_bomer_timer_timeout() -> void:
    can_bomer = true
        
