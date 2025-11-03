extends State
@export var enemy:CharacterBody2D
func enter():
	enemy.speed += 2000
func physics_update(delta):
	enemy.velocity.x = enemy.direction * enemy.speed * delta
func exit():
	enemy.speed -= 2000


func _on_vision_body_exited(body: Node2D) -> void:
	#changes state
	if state_machine.current_state == self:
		state_machine.change_state("idle")
