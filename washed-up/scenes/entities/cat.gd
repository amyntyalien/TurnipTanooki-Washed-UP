# cat.gd
extends Node2D

func _unhandled_input(event):
	if event.is_action_pressed("catcutscene"): # Map 'C'
		start_pan()

func start_pan():
	# Find the camera in the scene tree
	var camera_nodes = get_tree().get_nodes_in_group("player_camera")
	if camera_nodes.size() > 0:
		var cam = camera_nodes[0]
		# Define where to look
		var focus_point = Vector2(1723.0, -616) # Replace with target global position
		
		# Trigger the pan
		cam.pan_to(focus_point, 2.0)
