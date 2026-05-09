extends Area2D

var float_speed = randf_range(10.0, 20.0) # Subtle speed
var direction = Vector2(randf_range(-1, 1), 0).normalized() # Random left or right
var lifetime = randf_range(10.0, 20.0) # How long they exist

func _process(delta):
	# Move slowly horizontally
	position += direction * float_speed * delta
	
	# Makes it look like it is bobbing
	position.y += sin(Time.get_ticks_msec() * 0.001) * 0.2
	
	# Delete after a certain amount of time
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
