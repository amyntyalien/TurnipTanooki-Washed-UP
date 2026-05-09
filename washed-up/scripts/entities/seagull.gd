extends Area2D

var speed = 50
var direction = Vector2.ZERO
var is_moving = false
var velocity = Vector2.ZERO

# Get screen size to keep seagull in bounds
@onready var screen_size = get_viewport_rect().size

func _ready():
	# Start moving immediately
	set_new_random_target()

func _process(delta):
	if is_moving:
		position += direction * speed * delta
	
	# Get camera-aware bounds instead of static screen size
	var camera = get_viewport().get_camera_2d()
	if camera:
		var half_screen = get_viewport_rect().size * 0.5 / camera.zoom
		var cam_pos = camera.global_position
		
		var min_x = cam_pos.x - half_screen.x
		var max_x = cam_pos.x + half_screen.x
		var min_y = cam_pos.y - half_screen.y
		var max_y = cam_pos.y + half_screen.y
		
		# Clamp position instead of wrapping (removes jank + offscreen jumps)
		position.x = clamp(position.x, min_x, max_x)
		position.y = clamp(position.y, min_y, max_y)
	else:
		# Fallback clamp if no camera exists
		var half_screen = get_viewport_rect().size * 0.5
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)

func set_new_random_target():
	# Randomly decide to move or stop
	is_moving = randf() > 0.3 # 70% chance to move, 30% to stop
	
	if is_moving:
		# Pick a random direction
		direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		# Face the direction of movement (assuming seagull faces right by default)
		rotation = direction.angle()
	
	# Wait for a random amount of time (1 to 3 seconds) before changing state
	await get_tree().create_timer(randf_range(1.0, 3.0)).timeout
	set_new_random_target()
