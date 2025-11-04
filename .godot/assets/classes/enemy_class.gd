extends CharacterBody2D
class_name enemy_stats



func take_damage(health,weapon_damage):
	health -= weapon_damage
	return health
