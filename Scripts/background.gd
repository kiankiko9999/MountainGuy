extends Node2D

#var gameController = get_parent().get_parent()
var speed = 16
var clone = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var backgroundController = get_parent()
	speed= backgroundController.speed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var backgroundController = get_parent()
	speed = backgroundController.speed
	move_local_x(-speed*delta)
	move_local_y(speed*delta)
	if global_position.y >200 && clone:
		get_parent().spawnBackground()
		clone = false
	pass
