extends Node2D
class_name LevelParent

var laser_scene: PackedScene = load("res://scenes/projectiles/laser.tscn")
var bomer_scene: PackedScene = load("res://scenes/projectiles/bomer.tscn")


func _on_player_shoot_bomer(pos, direction) -> void:
    var bomer = bomer_scene.instantiate() as RigidBody2D
    bomer.position = pos
    bomer.linear_velocity = direction * bomer.speed
    $Projectiles.add_child(bomer)
    $UI.on_update_bomb_label()

func _on_player_shoot_laser(pos: Vector2, direction: Vector2) -> void:
    var laser = laser_scene.instantiate() as Area2D
    laser.position = pos
    laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
    laser.direction = direction
    $Projectiles.add_child(laser)
    $UI.on_update_laser_label()


func _on_house_player_entered() -> void:
    var tween = get_tree().create_tween()
    tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited() -> void:
    var tween = get_tree().create_tween()
    tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1)
    
