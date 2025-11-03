extends State
@export var sprite:AnimatedSprite2D
@export var player:CharacterBody2D
func enter():
	sprite.animation = "walk"
	sprite.frame = 1
	sprite.play()


func physics_update(delta):

	if player.input_order.size() > 0:
		player.velocity.x = player.input_order.back() * player.speed * delta
	else:
		player.velocity.x = 0
		state_machine.change_state("idle")
	if Input.is_action_pressed("ui_accept") && player.is_on_floor():
		state_machine.change_state("jump")
	if Input.is_action_pressed("left click"):
		state_machine.change_state("attack")

			
