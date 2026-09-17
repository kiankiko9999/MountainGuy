extends AnimatableBody2D
var speed = 20

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	print("hello")
	move_local_x(-speed * 160/144 *delta)
	move_local_y(speed *delta)
	pass
