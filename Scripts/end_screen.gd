extends Node2D
@export_file("res://Scenes/base_scene.tscn") var game: String
@onready var fade: CanvasLayer = $Fade
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var splat= $Splat
@onready var endSong= $EndingTune

var endSequence: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	endSequence = true
	var baseScene= preload("res://Scenes/base_scene.tscn")
	animation.play("Gold")
	await get_tree().create_timer(2).timeout
	splat.play()
	#await fade.fade(0, 1).finished
	#await fade.fade(1, 1).finished
	animation.play("Fake")
	await fade.fade(0, 1).finished
	await fade.fade(1, 1).finished
	animation.play("Mountain")
	endSong.play()
	await fade.fade(0, 1).finished
	endSequence = false
	pass # Replace with function body


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") && endSequence == false:
		print("bruh")
		# .finished is a tween method
		await fade.fade(1, 1).finished
		get_tree().change_scene_to_file("res://Scenes/base_scene.tscn")
	pass
