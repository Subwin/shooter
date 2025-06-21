extends Node2D

var laser_scene: PackedScene = load("res://scenes/projectiles/laser.tscn")
var bomer_scene: PackedScene = load("res://scenes/projectiles/bomer.tscn")

func _on_gate_body_enterd() -> void:
    print("body enterd")


func _on_player_shoot_bomer(pos, direction) -> void:
    var bomer = bomer_scene.instantiate() as RigidBody2D
    bomer.position = pos
    bomer.linear_velocity = direction * bomer.speed
    $Projectiles.add_child(bomer)
    print("shoot boomer")

func _on_player_shoot_laser(pos: Vector2, direction: Vector2) -> void:
    var laser = laser_scene.instantiate() as Area2D
    laser.position = pos
    laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
    laser.direction = direction
    $Projectiles.add_child(laser)
    print("shoot laser")
