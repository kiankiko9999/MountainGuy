extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.color.a = 0.0

# Function for fade in fade out, alpha is the property for transparency
func fade(target_alpha: float, duration: float = 1.0):
	# Tween for interpolating "a" property for smooth fade in/fade out
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", target_alpha, duration)
	return tween
