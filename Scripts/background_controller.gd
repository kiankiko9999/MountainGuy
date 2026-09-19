extends Node2D
@export var background: PackedScene

@export var speed = 20
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var game = get_parent()
	speed = game.platSpeed
	var backgroundObject = background.instantiate()
	backgroundObject.position = Vector2(0, 0)
	add_child(backgroundObject)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var game = get_parent()
	speed = game.platSpeed
	pass

func spawnBackground():
	var backgroundObject = background.instantiate()
	backgroundObject.position = Vector2(0, -407)
	add_child(backgroundObject)
