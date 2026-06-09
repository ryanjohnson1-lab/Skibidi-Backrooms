extends CharacterBody3D

@export var speed: float = 5.0
var player: Node3D = null

func _ready() -> void:
	# This finds the player in your game world using the group name
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	# If the player exists in the game, run towards them
	if player != null:
		
		# 1. Get the direction from the enemy to the player
		var direction = global_position.direction_to(player.global_position)
		
		# 2. Set the enemy's horizontal movement speed
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		# 3. Look at the player so the enemy faces them
		# (We clamp the Y axis so the enemy doesn't tilt up or down)
		var look_target = player.global_position
		look_target.y = global_position.y
		look_at(look_target, Vector3.UP)

	# Apply gravity so the enemy stays on the floor
	if not is_on_floor():
		velocity.y -= 9.8 * delta

	# This is the built-in function that actually moves the character
	move_and_slide()
