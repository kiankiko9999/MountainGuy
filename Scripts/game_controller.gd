extends Node2D

#Small,medium,large platform
@export var sPf: PackedScene
@export var mPf: PackedScene
@export var lPf: PackedScene
@export var character: PackedScene

@export var platSpawnRate = 0.0
@export var platMinDistanceRatio = 0.5

#These are the difficulty proportions of the total y distance the character needs to jump to reach the next platform
#Not to be changed except by game devs 
@export var easyRatio = 0.4
@export var mediumRatio = 0.6
@export var hardRatio = 0.8

@export var sPfRatio = 0.3
@export var mPfRatio = 0.5
@export var lPfRatio = 0.2

#Idle Time for when platform doesn't spawn
var idTiS1 = 0.0
var idTiM1 = 0.0
var idTiL1 = 0.0

#Dynamic proportions, changed by the game
var spawnRateS1: float
var spawnRateM1: float
var spawnRateL1: float
@export var platSpeed = 32

#Dimensions of the spawnbox outside of the camera
var minX = 110
var maxX = 210
var maxY = -118
var minY = -202

var timeToJumpHeight: float
var maxJumpHeight: float 
var platydistance: float
var totalydistance: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var mMan = character.instantiate()
	mMan.position = Vector2(-2000, 2000)
	
	# The max jump height of the mountain man by himself
	timeToJumpHeight = mMan.JUMP_VELOCITY/980
	maxJumpHeight = 2 * mMan.JUMP_VELOCITY * mMan.JUMP_VELOCITY / 980

# The y distance platforms move enroute --> MAKE SURE TO ADD SPEED MULTIPLIER
	platydistance = platSpeed * timeToJumpHeight
	
# The total y distance character moves relative to the platform
	totalydistance = platydistance + maxJumpHeight
	
	spawnRateS1 = easyRatio
	spawnRateM1 = easyRatio
	spawnRateL1 = easyRatio
	speedUp()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	idTiS1 += delta
	idTiM1 += delta
	idTiL1 += delta
	if (-timeToJumpHeight/(easyRatio * sPfRatio)) <= idTiS1:
		spawnS1()
	if (-timeToJumpHeight/(easyRatio * mPfRatio)) <= idTiM1:
		spawnM1()
	if (-timeToJumpHeight/(easyRatio * lPfRatio)) <= idTiL1:
		spawnL1()
		
		
	#if randf() < spawnRateS1:
		#spawnS1()
	#spawnRateS1 += 0.01 * delta
	
	# character can jump 8 instances of time to jump height spawn rate
	
	

func randLocation() -> Vector2:
	var rand_x = round(randf_range(minX, maxX + 60))
	var rand_y = round(((maxY-minY)/(maxX-minX)) * (rand_x - minX) + maxY)
	return Vector2(rand_x, rand_y)
	# var rand_x = round(randf_range(minX, maxX))
	# var rand_y = round(randf_range(maxX, maxY))
	# return Vector2(rand_x, rand_y)

func spawnS1():
	idTiS1 = 0
	spawnRateS1 = 0
	var instanceSPf = sPf.instantiate()
	instanceSPf.position = randLocation()
	add_child(instanceSPf)
	
func spawnM1():
	idTiM1 = 0
	spawnRateM1 = 0
	var instanceMPf = mPf.instantiate()
	instanceMPf.position = randLocation()
	add_child(instanceMPf)
	
func spawnL1():
	idTiL1 = 0
	spawnRateL1 = 0
	var instanceLPf = lPf.instantiate()
	instanceLPf.position = randLocation()
	add_child(instanceLPf)

func speedUp():
	await get_tree().create_timer(5.0).timeout
	platSpeed += 16
	speedUp()
