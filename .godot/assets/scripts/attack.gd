extends State
@export var sprite:AnimatedSprite2D
@export var player:CharacterBody2D
@export var attack_hitbox:Area2D
var attack_combo:int = 0
var is_attacking:bool
#var sword_hitbox = preload("res://assets/scene/attack_hitbox.tscn")

func enter():
	#var swordHitBox = sword_hitbox.instantiate()
	#$"../../attack point".add_child(swordHitBox)
	$"../../Timer".start()
	print("enter")
	attack_hitbox.show()
	attack_hitbox.collision.disabled = false
		
			
	

func update(_delta:float):

	if is_attacking == false:
		if player.is_on_floor() == false:
			
			sprite.play("jump attack")
			is_attacking = true

		if player.is_on_floor() == true:
			if attack_combo == 0:
				sprite.play("Attack")
				attack_combo += 1
			else:
				sprite.play("Attack2")
				attack_combo -=1
			is_attacking = true
		
func physics_update(delta):
	if player.is_on_floor():
		player.velocity.x = lerpf(player.velocity.x,0,0.2)
	else:
		if player.input_order.size() > 0:
			player.velocity.x = player.input_order.back() * player.speed * delta

func exit():
	print("Exit")
	is_attacking = false
	attack_hitbox.hide()
	attack_hitbox.collision.disabled = true

func _on_animated_sprite_2d_animation_finished() -> void:
		if is_attacking and player.is_on_floor():
			state_machine.change_state("idle")
			attack_hitbox.hide()
			attack_hitbox.collision.disabled = true
		elif is_attacking and player.is_on_floor() == false:
			state_machine.change_state("jump")
			attack_hitbox.hide()
			attack_hitbox.collision.disabled = true


func _on_timer_timeout() -> void:
	attack_combo = 0
