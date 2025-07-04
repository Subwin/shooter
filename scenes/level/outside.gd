extends LevelParent

@export var inside_scene:PackedScene = preload("res://scenes/level/inside.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

func _on_gate_body_enterd() -> void:
    var tween = get_tree().create_tween()
    tween.tween_property($Player, "speed", 0, 0.5)
    TransitionLayer.change_scene("res://scenes/level/inside.tscn")
