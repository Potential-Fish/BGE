extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var player = body
		
		player.weapon.change_weapon(player.weapon.weapon1)
		
