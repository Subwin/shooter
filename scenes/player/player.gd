extends CharacterBody2D

func _process(delta: float) -> void:
    var dirction = Input.get_vector("left", "right", "up", "down")
    velocity = dirction * 600
    move_and_slide()
    
    if Input.is_action_pressed("primary action"):
        print("shoot")
    if Input.is_action_pressed("secondary action"):
        print("bomb")
