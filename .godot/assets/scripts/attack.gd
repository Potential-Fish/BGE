extends State
@export var sprite:AnimatedSprite2D
@export var player:CharacterBody2D
@export var attack_hitbox:Area2D

var is_attacking:bool
#var sword_hitbox = preload("res://assets/scene/attack_hitbox.tscn")

func enter():
	#var swordHitBox = sword_hitbox.instantiate()
	#$"../../attack point".add_child(swordHitBox)
	attack_hitbox.show()
	attack_hitbox.collision.disabled = false
	
			
	

func update(_delta:float):

	if is_attacking == false:
		if player.is_on_floor() == false:
			
			sprite.play("jump attack")
			is_attacking = true
		if player.is_on_floor() == true:
			sprite.play("Attack")
			is_attacking = true
func physics_update(delta):
	if player.is_on_floor():
		player.velocity.x = lerpf(player.velocity.x,0,0.1)
	

func exit():
	is_attacking = false


func _on_animated_sprite_2d_animation_finished() -> void:
		if is_attacking and player.is_on_floor():
			state_machine.change_state("idle")
			attack_hitbox.hide()
			attack_hitbox.collision.disabled = true
		elif is_attacking and player.is_on_floor() == false:
			state_machine.change_state("jump")
			attack_hitbox.hide()
			attack_hitbox.collision.disabled = true
