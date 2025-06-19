extends Sprite2D

func _ready() -> void:
    position.x = 100
    position.y = 200
    
var vec = Vector2(10,0)
    
func _process(delta: float) -> void:
    if position.x >= 1150 or position.x <= 0:
        vec.x *= -1
    position += vec*50*delta
    
