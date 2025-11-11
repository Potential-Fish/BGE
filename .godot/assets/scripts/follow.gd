extends State
@export var enemy:CharacterBody2D
@export var sprite:AnimatedSprite2D
@export var idle:State
@onready var follow_speed = enemy.speed + 2000
func enter():
	sprite.play("Idle")
func physics_update(delta):
	#follows the player, could use updating to follow even when leaving area so it follows when you jump above
	enemy.direction = enemy.player_direction
	enemy.velocity.x = enemy.player_direction * follow_speed * delta

	
	if enemy.player_in_attack_range:
		state_machine.change_state("attack")
func exit():
	pass


func _on_vision_body_exited(body: Node2D) -> void:
	#changes state
	if body.is_in_group("player"):
		if state_machine.current_state == self:
			state_machine.change_state("idle")
