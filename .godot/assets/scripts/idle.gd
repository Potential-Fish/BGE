extends State
@export var enemy:CharacterBody2D
@export var sprite:AnimatedSprite2D
var player_in_range:bool = false
var rng = RandomNumberGenerator.new()
func enter():
	sprite.play("Idle")
func update(delta):
	
	#changes direction based on raycast collision
	if enemy.right_floor.is_colliding() == false:
		enemy.direction = -1
	if enemy.right_wall.is_colliding():
		if enemy.right_wall.get_collider().is_in_group("player") == false:
			enemy.direction = -1
	if enemy.left_floor.is_colliding() == false:
		enemy.direction = 1
	if enemy.left_wall.is_colliding():
		if enemy.left_wall.get_collider().is_in_group("player") == false:
			enemy.direction = 1
	
func physics_update(delta):
	#movement
	
	enemy.velocity.x = enemy.direction * enemy.speed * delta 
	if player_in_range and enemy.direction == enemy.player_direction:
		state_machine.change_state("follow")
		
func _on_vision_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true

	
func _on_timer_timeout() -> void:
	#randomly changes the direction
	if state_machine.current_state == self:
		var random = rng.randf_range(1,10)
		print(random)
		if random >= 5:
			
			enemy.direction = enemy.direction * -1


func _on_vision_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
