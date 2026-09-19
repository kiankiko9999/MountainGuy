extends AnimatableBody2D
var game = get_parent()

var speed = 20

func _ready() -> void:
	var game = get_parent()
	speed = game.platSpeed
	pass

func _physics_process(delta: float) -> void:
	move_local_x(-speed *delta)
	move_local_y(speed *delta)
	pass


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
