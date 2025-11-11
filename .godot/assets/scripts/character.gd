extends CharacterBody2D

var input_order:Array
var speed: int = 30000
var knockback_timer:float
var knockback:Vector2
var direction
var direction_KB
var facing_dir:String = "right"
var largest
signal touched_ground
var health:int = 25
@export var weapon:Node
@export var state_machine:StateMachine
func _ready() -> void:
	$AnimatedSprite2D.frame = 5

func _physics_process(delta: float) -> void:
	attack_point()
	Global.player_position = global_position
	Global.player_local_pos = position
	
	if Input.is_action_just_pressed("left click"):
		
		pass
	if knockback_timer > 0:
		
		$".".velocity = -knockback
		knockback_timer -= delta 
		if knockback_timer <= 0:
			knockback_timer = 0
			state_machine.change_state("idle")


	
	if Input.is_action_just_pressed("left"):
		input_order.append(-1)
		
	if Input.is_action_just_pressed("right"):
		input_order.append(1)
		facing_dir = "right"
	if Input.is_action_just_released("left"):
		input_order.erase(-1)
	if Input.is_action_just_released("right"):
		input_order.erase(1)
	if input_order.is_empty() == false:	
		if input_order.back() == -1:
			direction = "left"
		if  input_order.back() == 1:
			direction = "right"
	if direction == "left":
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

	if velocity.y > 0:
		velocity.y += get_gravity().y * 3 * delta
	elif velocity.y <=0:
		velocity.y += get_gravity().y * 2 * delta
	
	
	
	move_and_slide()


	
func apply_knockback(direction:Vector2,force:int,duration:float):

	knockback = direction * force
	
	knockback_timer = duration

		
	
func attack_point():
	#makes sure youre attacking the right direction
	if $AnimatedSprite2D.flip_h:
		$"attack point".position.x = -20
		$"attack point/Area2D2".rotation_degrees = 180
	else:
		$"attack point".position.x = 0
		$"attack point/Area2D2".rotation_degrees = 0
		



func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		var enemy = body
		



func _on_hitbox_area_entered(area: Area2D) -> void:
	# needs changing, so the damage and kb gets decided on the enemy side
	if area.is_in_group("enemy_attack_HB") or area.is_in_group("enemy"):
		direction_KB = Vector2(area.get_parent().global_position - global_position).normalized()
		state_machine.change_state("Hurt")
	
		
		
