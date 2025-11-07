extends State
@export var enemy:CharacterBody2D
@onready var follow_speed = enemy.speed + 2000
func enter():
	pass
func physics_update(delta):
	#follows the player, could use updating to follow even when leaving area so it follows when you jump above
	enemy.velocity.x = enemy.direction * follow_speed * delta
func exit():
	pass


func _on_vision_body_exited(body: Node2D) -> void:
	#changes state
	if state_machine.current_state == self:
		state_machine.change_state("idle")
