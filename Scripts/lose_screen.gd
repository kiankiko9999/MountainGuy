extends Node2D
@export_file("res://Scenes/base_scene.tscn") var game: String
@onready var fade: CanvasLayer = $Fade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var baseScene= preload("res://Scenes/base_scene.tscn")
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		print("bruh")
		# .finished is a tween method
		await fade.fade(1, 1).finished
		get_tree().change_scene_to_file("res://Scenes/base_scene.tscn")
	pass
