extends Camera2D
@export var player:CharacterBody2D
func _physics_process(delta: float) -> void:
	self.global_position = lerp(global_position,player.global_position,0.1)
