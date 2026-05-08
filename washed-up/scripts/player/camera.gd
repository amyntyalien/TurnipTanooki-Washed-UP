extends Node

@export var follow_speed := 5.0

func _process(delta):
	if get_parent() == null:
		return
	global_position = global_position_lerp(
		get_parent().global_position, follow_speed * delta
	)
