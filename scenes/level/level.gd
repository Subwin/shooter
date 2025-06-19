extends Node2D

func _ready() -> void:
    $Logo.rotation_degrees = 90

func _process(delta: float) -> void:
    $Logo.rotation_degrees += 10*delta

 
