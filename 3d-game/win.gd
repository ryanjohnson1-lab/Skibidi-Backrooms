extends Control

func _ready() -> void:
	# Hide the image automatically when the game starts
	hide()

func trigger_win() -> void:
	show()
	
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene()
