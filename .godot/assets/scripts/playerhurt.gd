extends State
@export var sprite:AnimatedSprite2D
@export var player:CharacterBody2D
@export var attack_hitbox:Area2D
var knockback_timer:float
var knockback:Vector2
func enter():
	attack_hitbox.hide()
	attack_hitbox.collision.disabled = true
	player.velocity = Vector2.ZERO
	
	player.apply_knockback(player.direction_KB,400,0.12)

	
