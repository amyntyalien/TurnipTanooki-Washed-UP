extends Node2D

var trashes = []
func _ready():
	# gets Wood, Plastic, etc.
	var all_visuals = get_children()
	if all_visuals.is_empty():
		push_error("No junk visuals found in junk.tscn!")
		return
	
	var num_to_show = randi_range(1, min(3, all_visuals.size())) # How many (min 1)
	
	for i in range(num_to_show):
		trashes.append(all_visuals.pick_random())
		
		set_process_input(true)
		
# when junk is clicked on with the left mouse key, it goes to Inventory.add_trash().
#
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed():
			_on_junk_clicked()
			
func _on_junk_clicked():
	print("Junk clicked!")
	queue_free()
#

func _process(_delta):
	print(JSON.stringify(Inventory.trash))
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_C:
			print("AAAA")
			for i in range(randi_range(1, 10)):
				Inventory.add_trash(["wood", "bottle", "plastic", "pizza"].pick_random(), randi_range(1,3))
			set_process_input(false)
#
