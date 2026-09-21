extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fall()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fall():
	await get_tree().create_timer(10.0).timeout
	print("bye")
	queue_free()
