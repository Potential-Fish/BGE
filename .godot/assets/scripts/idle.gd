extends State
@export var enemy:CharacterBody2D
var rng = RandomNumberGenerator.new()
func update(delta):
	#changes direction based on raycast collision
	if enemy.right_floor.is_colliding() == false or enemy.right_wall.is_colliding():
		enemy.direction = -1
	if enemy.left_floor.is_colliding() == false or enemy.left_wall.is_colliding():
		enemy.direction = 1
	
func physics_update(delta):
	#movement
	enemy.velocity.x = enemy.direction * enemy.speed * delta
	enemy.vision.position.x = 70 * enemy.direction 


func _on_vision_body_entered(body: Node2D) -> void:
	#chages state
	if state_machine.current_state == self:
		state_machine.change_state("follow")


func _on_timer_timeout() -> void:
	#randomly changes the direction
	if state_machine.current_state == self:
		var random = rng.randf_range(1,10)
		print(random)
		if random >= 5:
			print(enemy.direction)
			enemy.direction = enemy.direction * -1
