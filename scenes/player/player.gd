extends CharacterBody2D

signal shoot_laser(pos)
signal shoot_bomer(pos)

var can_laser = true
var can_bomer = true

func _process(delta: float) -> void:
    var dirction = Input.get_vector("left", "right", "up", "down")
    velocity = dirction * 600
    move_and_slide()
    
    if Input.is_action_pressed("primary action") and can_laser:
        can_laser = false
        $LaserTimer.start()
        
        var laser_markers = $LaserStartPositions.get_children()
        var selected_marker = laser_markers[randi() % laser_markers.size()]
        shoot_laser.emit(selected_marker.global_position)
        
    if Input.is_action_pressed("secondary action") and can_bomer:
        can_bomer = false
        $BomerTimer.start()
        
        var bomer_markers = $LaserStartPositions.get_children()
        var selected_marker = bomer_markers[randi() % bomer_markers.size()]
        shoot_bomer.emit(selected_marker.global_position)
        

func _on_laser_timer_timeout() -> void:
    can_laser = true

func _on_bomer_timer_timeout() -> void:
    can_bomer = true
