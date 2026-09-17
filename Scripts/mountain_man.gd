extends CharacterBody2D
@onready var animator = $AnimatedSprite2D

var SPEED = 100.0
const JUMP_VELOCITY = -400.0
var doublejump = true
var air_resistance: float = 10.0
var maxAirSpeed: float = 70.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	var direction := Input.get_axis("ui_left", "ui_right")
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = move_toward(velocity.x, maxAirSpeed * velocity.normalized().x , air_resistance)
	else:
		doublejump = true
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		animator.play("Jump")
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction && is_on_floor():
		velocity.x = direction * SPEED
	elif direction:
		velocity.x = direction * maxAirSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, air_resistance)
	if Input.is_action_pressed("ui_left") && is_on_floor() && !Input.is_action_just_pressed("ui_accept") && !Input.is_action_pressed("ui_right"):
		print("left")
		animator.play("Walk Left")
	elif Input.is_action_pressed("ui_right") && is_on_floor() && !Input.is_action_just_pressed("ui_accept") && !Input.is_action_pressed("ui_left"):
		print("right")
		animator.play("Walk Right")
	elif !Input.is_action_just_pressed("ui_accept") && is_on_floor():
		animator.play("Idle")
	
	if doublejump && !is_on_floor() && Input.is_action_just_pressed("ui_accept"):
		velocity.x = direction * 1000
		if velocity.y >0:
			velocity.y = direction * 100
		doublejump = false
		

	move_and_slide()
