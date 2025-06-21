extends Node2D

var laser_scene: PackedScene = load("res://scenes/projectiles/laser.tscn")
var bomer_scene: PackedScene = load("res://scenes/projectiles/bomer.tscn")

func _on_gate_body_enterd() -> void:
    print("body enterd")


func _on_player_shoot_bomer(pos) -> void:
    var bomer = bomer_scene.instantiate()
    bomer.position = pos
    $Projectiles.add_child(bomer)
    print("shoot boomer")

func _on_player_shoot_laser(pos) -> void:
    var laser = laser_scene.instantiate()
    laser.position = pos
    $Projectiles.add_child(laser)
    print("shoot laser")
