extends Node2D

func _ready():
	# gets Wood, Plastic, etc.
	var all_visuals = get_children()
	if all_visuals.is_empty():
		push_error("No junk visuals found in junk.tscn!")
		return

	for child in all_visuals: # Hide everything first
		if child is CanvasItem: # make sure it can be visible
			child.visible = false
	
	var num_to_show = randi_range(1, min(3, all_visuals.size())) # How many (min 1)
	
	for i in range(num_to_show):
		var random_choice = all_visuals.pick_random()
		
		# If already visible, try to pick another, or skip to avoid duplicates
		if random_choice.visible:
			# try again once
			random_choice = all_visuals.pick_random()
			
		random_choice.visible = true
		set_process_input(true)
		
# when junk is clicked on with the left mouse key, it goes to Inventory.add_trash().
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed():
			_on_junk_clicked()
			
func _on_junk_clicked():
	print("Junk clicked!")
	queue_free()
