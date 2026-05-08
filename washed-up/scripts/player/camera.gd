extends Camera2D

@export var follow_speed := 5.0

func _process(delta):
	if get_parent() == null:
		return
	# lerp should usually use the target position, not self.global_position
	global_position = global_position.lerp(
		get_parent().global_position, follow_speed * delta
	)
