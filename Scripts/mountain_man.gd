extends CharacterBody2D
@onready var animator = $AnimatedSprite2D
@onready var jump= $jump
@onready var doubleJump= $doubleJump
@onready var land= $land
@export var lose = PackedScene
var SPEED = 150.0
@export var JUMP_VELOCITY = -400.0
var doublejump = true
var air_resistance: float = 10.0
var maxAirSpeed: float = 150.0
var airAcceleration: float= 550.0
var amInAir


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if is_on_floor():
		groundedMovement(delta, direction)
	else:
		airMovement(delta, direction)
	if(global_position.y > 300):
		die()
	move_and_slide()

func groundedMovement(delta, direction):
	doublejump = true
	if amInAir:
		land.play()
	amInAir = false
	if Input.is_action_just_pressed("ui_accept"):
		animator.play("Jump")
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED 
		airMovement(delta, direction)
		jump.play()
		return
	if direction:
		velocity.x = direction * SPEED
	if Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		# print("left")
		animator.play("Walk Left")
	elif Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		# print("right")
		animator.play("Walk Right")
	else:
		velocity = Vector2(0,0)
		animator.play("Idle")

func airMovement(delta, direction):
	velocity += get_gravity() * delta
	amInAir = true
	if  direction:
		# print(direction)
		if abs(velocity.x) < 150:
			velocity.x += direction * airAcceleration *delta
		else:
			velocity.x = move_toward(velocity.x, maxAirSpeed * velocity.normalized().x , air_resistance)
	elif abs(velocity.x) < 150 && abs(velocity.x) > 0: 
		velocity.x = move_toward(velocity.x, maxAirSpeed * direction, air_resistance)
	if doublejump && !is_on_floor() && Input.is_action_just_pressed("ui_accept"):
		doubleJump.play()
		velocity.x = direction * 250 
		if Input.is_action_pressed("ui_down"):
			velocity.y += 150
		elif velocity.y >0:
			velocity.y =0
			velocity.y += -150
		else:
			velocity.y += -150
		doublejump = false

func die():
	get_tree().change_scene_to_packed(lose)
	queue_free()
