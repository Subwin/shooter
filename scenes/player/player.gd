extends Node2D

func _process(delta: float) -> void:
    var dirction = Input.get_vector("left", "right", "up", "down")
    position += dirction * 600 * delta
    
    if Input.is_action_pressed("primary action"):
        print("shoot")
    if Input.is_action_pressed("secondary action"):
        print("bomb")
