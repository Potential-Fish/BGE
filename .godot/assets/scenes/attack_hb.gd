extends Area2D
@export var timer:Timer
@export var collision:CollisionShape2D
func _ready() -> void:
	$Timer.start()
	hide()
	$CollisionShape2D.disabled = true
func _physics_process(delta: float) -> void:
	await get_tree().create_timer(0.09).timeout
	


func _on_timer_timeout() -> void:
	print("hide")
	
