# PlayerCamera.gd (Attached to Camera2D inside Player Scene)
extends Camera2D

var is_panning := false
@onready var player = get_parent() # Assuming Camera is child of player

func _ready():
	add_to_group("player_camera") # Easiest way to find it from anywhere

func pan_to(target_pos: Vector2, duration: float):
	if is_panning: return
	is_panning = true
	
	# Disable smoothing temporarily to prevent lagging behind
	var old_smoothing = position_smoothing_enabled
	position_smoothing_enabled = false
	
	# Create a tween for the movement
	var tween = create_tween()
	# Tween camera global position to target
	tween.tween_property(self, "global_position", target_pos, duration)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
	# Wait for panning to finish
	await tween.finished
	
	# Return control to player (smoothly)
	return_to_player(old_smoothing)

func return_to_player(restore_smoothing: bool):
	var tween = create_tween()
	# Tween back to player (local position 0,0)
	tween.tween_property(self, "position", Vector2.ZERO, 0.5)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		
	await tween.finished
	position_smoothing_enabled = restore_smoothing
	is_panning = false
