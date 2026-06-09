extends Sprite2D

@export var shake_intensity: float = 10.0
@export var is_shaking: bool = true       

var original_position: Vector2

func _ready() -> void:
	original_position = position

func _process(_delta: float) -> void:
	if is_shaking:
		var random_offset = Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity)
		)
		position = original_position + random_offset
	else:
		position = original_position
