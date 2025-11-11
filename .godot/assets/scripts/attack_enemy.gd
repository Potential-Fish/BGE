extends State
@export var enemy:CharacterBody2D
@export var sprite:AnimatedSprite2D
@export var attack_hb:Area2D
var is_attacking:bool = false
func enter():
	if is_attacking == false:
		is_attacking = true
		
		enemy.velocity.x = 0
		sprite.animation = "Attack"
		if enemy.direction == 1:
			sprite.offset.x = 4.475
			attack_hb.position = Vector2(14,0)
		else:
			sprite.offset.x = -10.58
			attack_hb.position = Vector2(-14,0)
		await get_tree().create_timer(0.5).timeout	
		attack_hb.show()
		attack_hb.collision.disabled = false
		await get_tree().create_timer(0.2).timeout	
		attack_hb.hide()
		attack_hb.collision.disabled = true
		is_attacking = false
		state_machine.change_state("follow")
		
func _on_sprite_2d_animation_finished() -> void:
	if state_machine.current_state == self:

		state_machine.change_state("follow")
		
func exit():
	attack_hb.hide()
	set_deferred("attack_hb.collision.disabled",true) 
