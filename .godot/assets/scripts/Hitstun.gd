extends Node

func hitstun(enemy):
	#adds a pause when hitting
	await get_tree().create_timer(0.1,false,false,true).timeout
	Engine.time_scale = 0
	enemy.modulate = Color("blue")
	await get_tree().create_timer(0.1,false,false,true).timeout
	Engine.time_scale = 1
	enemy.modulate =Color("white")
