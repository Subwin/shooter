extends CharacterBody2D

signal shoot_laser
signal shoot_bomer

var can_laser = true
var can_bomer = true

func _process(delta: float) -> void:
    var dirction = Input.get_vector("left", "right", "up", "down")
    velocity = dirction * 600
    move_and_slide()
    
    if Input.is_action_pressed("primary action") and can_laser:
        can_laser = false
        $LaserTimer.start()
        shoot_laser.emit()
        
    if Input.is_action_pressed("secondary action") and can_bomer:
        can_bomer = false
        $BomerTimer.start()
        shoot_bomer.emit()
        

func _on_laser_timer_timeout() -> void:
    can_laser = true

func _on_bomer_timer_timeout() -> void:
    can_bomer = true
