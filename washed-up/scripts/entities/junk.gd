#junk.gd:
extends Node2D

signal collected

var trashes = [] # stores trash

# name for each thing in junk
@onready var click_areas = [
	$wood,
	$bottle,
	$plastic,
	$pizza
]

# runs when scene starts
func _ready():
	# connect signals
	for area in click_areas:
		area.input_event.connect(_on_input_event)
		area.area_entered.connect(_on_area_entered)

	
	var all_visuals = click_areas.duplicate() # duplicate list

	# stop if empty
	if all_visuals.is_empty():
		push_error("No junk visuals found!")
		return

	# hide all trash
	for visual in all_visuals:
		visual.visible = false

	# randomize order
	all_visuals.shuffle()

	# choose amount
	var num_to_show = randi_range(1, min(3, all_visuals.size()))

	# show random trash
	for i in range(num_to_show):
		var chosen = all_visuals[i]
		trashes.append(chosen)
		chosen.visible = true

# runs when clicked
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton: # check mouse click
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed: # check left click
			_on_junk_clicked() # collect junk

# runs when junk clicked
func _on_junk_clicked():
	print("Junk clicked!")

	# add random trash
	Inventory.add_trash(
		["wood", "bottle", "plastic", "pizza"].pick_random(),
		randi_range(1, 3)
	)
	queue_free() # remove junk

# runs when touching another area
func _on_area_entered(area):
	# check for seagull
	if area.name == "seagull":
		print("Seagull collected junk")
		emit_signal("collected")
		queue_free()
