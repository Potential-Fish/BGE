extends enemy_stats

@onready var right_wall: RayCast2D = $"Raycasts/Right wall"
@onready var left_wall: RayCast2D = $"Raycasts/Left wall"
@onready var right_floor: RayCast2D = $"Raycasts/Right Floor"
@onready var left_floor: RayCast2D = $"Raycasts/Left Floor"
@onready var vision: Area2D = $Vision
@export var speed:int 
@export var health:int
@export var sprite:AnimatedSprite2D
var player_in_attack_range:bool =false
var invincible_timer = 0
var direction = -1
var player_direction
func _process(delta: float) -> void:
	$Label.text = str(health)
	
	if invincible_timer > 0:
		invincible_timer -= delta
	
	if direction == 1:
		sprite.flip_h = false
		sprite.offset.x = 0
	elif direction == -1:
		sprite.flip_h = true
		sprite.offset.x = -7
func _physics_process(delta: float) -> void:
	#gravity pog
	if is_on_floor() == false:
		velocity.y = delta * get_gravity().y * 20
	
	if global_position.x - Global.player_position.x <= 0:
		player_direction = 1
	else:
		player_direction = -1	
		
	#death rip bozo
	if health <= 0:
		await get_tree().create_timer(0.1).timeout
		queue_free()
	move_and_slide()


func _on_attack_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):	
		print("wat?")
		player_in_attack_range = true



func _on_attack_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("huh")	
		player_in_attack_range = false
