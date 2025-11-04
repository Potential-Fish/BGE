extends Node

func hitstun(enemy):
	#adds a pause when hitting
	if enemy != null:
		await get_tree().create_timer(0.1,false,false,true).timeout
		Engine.time_scale = 0
		enemy.modulate = Color("blue")
	
		await get_tree().create_timer(0.1,false,false,true).timeout
		Engine.time_scale = 1
	if enemy != null:
		enemy.modulate =Color("white")
