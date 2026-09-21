extends Sprite2D

@export var game_scene: PackedScene
@export var end_scene: PackedScene

# Called when the node enters the scene tree for the first time.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		_on_play_clicked
	if Input.is_action_pressed("ui_right"):
		_on_endScene_clicked

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _on_play_clicked(viewport, event, shape_idx):
	get_tree().change_scene_to_packed(game_scene)
		
@warning_ignore("unused_parameter")
func _on_endScene_clicked(viewport, event, shape_idx):
	get_tree().change_scene_to_packed(end_scene)
