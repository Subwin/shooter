extends Area2D

var rotation_speed: int = 4
var options = ["laser", "laser", "laser", "bomb", "health"]
var type = options[randi() % len(options)]

func _ready() -> void:
    if type == "laser":
        $Sprite2D.modulate = Color.BLUE
    if type == "bomb":
        $Sprite2D.modulate = Color.RED
    if type == "health":
        $Sprite2D.modulate = Color.GREEN 
        
func _process(delta: float) -> void:
    rotation += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
    if type == "laser":
        Globals.laser_amount += 5
    if type == "bomb":
        Globals.bomb_amount += 1
    if type == "health":
        Globals.health += 10
    queue_free()
