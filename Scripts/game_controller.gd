extends Node2D
@export var platform16: PackedScene
@export var platform32: PackedScene
@export var platform48: PackedScene
@export var character: PackedScene

@export var platSpawnRate = 0.0
@export var platMinDistance = 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# The max jump height of the mountain man by himself
	var timeToJumpHeight = character.JUMP_VELOCITY/character.get_gravity()
	var maxJumpHeight = 2 * character.JUMP_VELOCITY * character.JUMP_VELOCITY / character.get_gravity()

# The y distance platforms move enroute --> MAKE SURE TO ADD SPEED MULTIPLIER
	var platydistance = platform16.speed * timeToJumpHeight
	var totalydistance = platydistance + maxJumpHeight
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
