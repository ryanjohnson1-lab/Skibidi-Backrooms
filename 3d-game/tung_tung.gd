extends Node3D

@onready var spawn_points = [
	$"../SpawnPoint1",
	$"../SpawnPoint2",
	$"../SpawnPoint3",
	$"../SpawnPoint4",
	$"../SpawnPoint5",
	$"../SpawnPoint6",
	$"../SpawnPoint7",
	$"../SpawnPoint8"
]

func _ready():
	global_transform = spawn_points.pick_random().global_transform


func _on_area_3d_body_entered(body: Node3D) -> void:
	
	if body.is_in_group("player"):
		var win = get_tree().get_first_node_in_group("win_ui")
		if win:
			win.trigger_win()
			set_physics_process(false)
		else:
			print("ERROR: Could not find a node in the 'win_ui' group!")
