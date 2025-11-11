extends State
@export var enemy:CharacterBody2D
@export var attack_hb:Area2D
var knockback 
var knockback_timer
var direction_kb

func enter():

	enemy.invincible_timer = 0.14
	enemy.velocity.x = 0
	
	
func physics_update(delta):

	
	#apllies knockback
	if knockback_timer > 0:
		await get_tree().create_timer(0.1,false,false,true).timeout
		knockback_timer -= delta
		enemy.velocity = -knockback
		if knockback_timer <=0:
			
			enemy.velocity = Vector2.ZERO
			
	else:
		state_machine.change_state(state_machine.past_states.back().name.to_lower())
func _on_hitbox_area_entered(area: Area2D) -> void:
	#enters this state
	if area.is_in_group("attackHB") and enemy.invincible_timer <=0:
		
		state_machine.change_state("hurt")
		#calculate damage taken
		var weapon = area.get_parent().get_parent().weapon.current_weapon.damage
		enemy.health = enemy.take_damage(enemy.health, weapon)
		#calculate the knockback
		direction_kb = Vector2(area.global_position - enemy.global_position).normalized()
		enemy.direction = snappedf(direction_kb.x,1)
		apply_knockback(direction_kb,400,0.18)
		
func apply_knockback(direction_kb,force,kb_timer):
	
	Hitstun.hitstun(enemy)
	knockback = direction_kb * force
	knockback_timer = kb_timer
