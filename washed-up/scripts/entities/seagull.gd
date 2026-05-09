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
		
		# Add screen wrapping so they don't fly away forever
		if position.x < 0: position.x = screen_size.x
		if position.x > screen_size.x: position.x = 0
		if position.y < 0: position.y = screen_size.y
		if position.y > screen_size.y: position.y = 0

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
