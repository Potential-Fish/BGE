extends State
@export var player:CharacterBody2D
@export var sprite:AnimatedSprite2D
func enter():
	
	player.velocity.x = 0
	sprite.animation = "idle"

func update(_delta:float):
	if player.input_order.is_empty() == false:
		
		state_machine.change_state("walk")
func physics_update(delta):
	if Input.is_action_pressed("ui_accept") and player.is_on_floor():
		state_machine.change_state("jump")
	if Input.is_action_pressed("left click"):
		state_machine.change_state("attack")
