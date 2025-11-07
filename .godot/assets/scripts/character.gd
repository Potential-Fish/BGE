extends CharacterBody2D

var input_order:Array
var speed: int = 30000
var knockback_timer:float
var knockback:Vector2
var direction
var facing_dir:String = "right"
var largest
signal touched_ground

@export var weapon:Node
func _ready() -> void:
	$AnimatedSprite2D.frame = 5

func _physics_process(delta: float) -> void:
	attack_point()
	
	if Input.is_action_just_pressed("left click"):
		
		pass
	if knockback_timer > 0:
		print(knockback_timer)
		$".".velocity = -knockback
		knockback_timer -= delta 
	


	
	if Input.is_action_just_pressed("left"):
		input_order.append(-1)
		print("left")
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




func _on_area_2d_area_entered(area: Area2D) -> void:
	#doesnt work rn, need to add hurt state
	if area.is_in_group("enemy"):
		direction = Vector2(area.global_position - global_position).normalized()
		
		apply_knockback(direction,400,0.12)

		
		pass
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
		
