extends StaticBody2D

signal body_enterd


func _on_area_2d_body_entered(body: Node2D) -> void:
    body_enterd.emit()
