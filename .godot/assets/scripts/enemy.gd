extends CharacterBody2D
@onready var right_wall: RayCast2D = $"Raycasts/Right wall"
@onready var left_wall: RayCast2D = $"Raycasts/Left wall"
@onready var right_floor: RayCast2D = $"Raycasts/Right Floor"
@onready var left_floor: RayCast2D = $"Raycasts/Left Floor"
@onready var vision: Area2D = $Vision
@export var speed:int = 3000
var invincible_timer = 0
var direction = 1
func _process(delta: float) -> void:
	
	if invincible_timer > 0:
		invincible_timer -= delta
func _physics_process(delta: float) -> void:
	if is_on_floor() == false:
		velocity.y = delta * get_gravity().y * 20
	move_and_slide()
