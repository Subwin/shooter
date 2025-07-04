extends Node
signal health_change
signal laser_amount_change
signal bomb_amount_change

var laser_amount = 2:
    get:
        return laser_amount
    set(value):
        laser_amount = value
        laser_amount_change.emit()
        
var bomb_amount = 1:
    get:
        return bomb_amount
    set(value):
        bomb_amount = value
        bomb_amount_change.emit()
        
var health = 60:
    get:
        return health
    set(value):
        health = value
        health_change.emit()
    
