extends Node2D

signal collected

var trashes = [] # Stores active trash visuals
@onready var click_areas = [
	$wood,
	$bottle,
	$plastic,
	$pizza
]

func _ready():
	# Connect signals for all potential junk items
	for area in click_areas:
		area.input_event.connect(_on_input_event)
		area.area_entered.connect(_on_area_entered)
		area.visible = false # Hide all initially

	# Randomize and show a subset of trash
	var all_visuals = click_areas.duplicate()
	all_visuals.shuffle()

	# Choose amount (1 to 3, or max available)
	var num_to_show = randi_range(1, min(3, all_visuals.size()))

	# Show random trash and add to active list
	for i in range(num_to_show):
		var chosen = all_visuals[i]
		trashes.append(chosen)
		chosen.visible = true

# Runs when clicked
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_collect_junk()

# Unified collection logic
func _collect_junk():
	print("Junk clicked!")
	
	# Add items to inventory based on what was visible
	for trash in trashes:
		# Assuming name matches Inventory requirement
		Inventory.add_trash(trash.name, randi_range(1, 3))
		
	queue_free() # Remove the container

# Runs when touching another area (e.g., Seagull)
func _on_area_entered(area):
	if area.name == "seagull":
		print("Seagull collected junk")
		emit_signal("collected")
		queue_free()
