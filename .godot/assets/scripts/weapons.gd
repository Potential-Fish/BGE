extends Node

var default_weapon = load("res://assets/Resource/default_weapon.tres")
var weapon1 = load("res://assets/Resource/Weapon1.tres")
var current_weapon:Resource


func _ready() -> void:
	current_weapon = default_weapon
func change_weapon(new_weapon):
	current_weapon = new_weapon
