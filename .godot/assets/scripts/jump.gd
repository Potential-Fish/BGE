extends State
@export var sprite:AnimatedSprite2D
@export var player:CharacterBody2D
@export var attack_hitbox:Area2D

func enter():
	attack_hitbox.hide()
	attack_hitbox.collision.disabled = true
	if Input.is_action_just_pressed("ui_accept"):
		player.velocity.y += -900

	
func physics_update(delta):
	
	if Input.is_action_just_pressed("left click"):
		state_machine.change_state("attack")
	if player.input_order.size() > 0:
		player.velocity.x = player.input_order.back() * player.speed * delta
	if player.velocity.y > 0:
		
		sprite.play("fall")
	else:
	
		sprite.play("jump")
	if player.is_on_floor() == true:
		
		state_machine.change_state("idle")
