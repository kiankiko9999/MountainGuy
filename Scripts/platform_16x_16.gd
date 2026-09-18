extends AnimatableBody2D
@export var speed = 20

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	move_local_x(-speed *delta)
	move_local_y(speed *delta)
	pass
