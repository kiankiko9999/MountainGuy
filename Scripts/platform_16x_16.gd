extends AnimatableBody2D
@onready var timer = $Timer
@onready var radius = $Radius
@onready var game = get_parent()

var speed = 20
var minX = 110
var maxX = 210
var maxY = -118
var minY = -202

var tpCounter = 0

func _ready() -> void:
	speed = game.platSpeed
	timer.start()
	pass

func _physics_process(delta: float) -> void:
	move_local_x(-speed *delta)
	move_local_y(speed *delta)
	pass

func randLocation() -> Vector2:
	# var rand_x = round(randf_range(minX, maxX + 60))
	# var rand_y = round(((maxY-minY)/(maxX-minX)) * (rand_x - minX) + maxY)
	# return Vector2(rand_x, rand_y)
	var rand_x = round(randf_range(minX, maxX))
	var rand_y = round(randf_range(minY, maxY))
	return Vector2(rand_x, rand_y)

func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.


func _on_radius_body_entered(body: Node2D) -> void:
	if body.global_position.y >= global_position.y:
		body.global_position.y += 10
		global_position.y -= 10
	elif body.global_position.y <= global_position.y:
		body.global_position.y -= 10
		global_position.y += 10
	elif body.global_position.x <= global_position.x:
		body.global_position.x -= 10
		global_position.x += 10
	else:
		body.global_position.x += 10
		global_position.x -= 10

	
	#tpCounter += 1
	timer.start(15)
	#position = randLocation()
	#if tpCounter >= 3:
	#	queue_free()
	#print("whoosh")
	#position.x -= 2
	#position.y += 2
	
