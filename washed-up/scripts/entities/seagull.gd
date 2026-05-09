# seagull.gd:
extends Area2D

var target = null
var speed = 300

# runs when scene starts
func _ready():
	# connect collision signal
	area_entered.connect(_on_area_entered)

# assign junk target
func set_target(junk_instance):
	target = junk_instance

# runs every frame
func _process(delta):
	# stop if no target
	if target == null:
		return

	# stop if target deleted
	if !is_instance_valid(target):
		queue_free()
		return

	# move toward junk
	position = position.move_toward(
		target.global_position,
		speed * delta
	)

# runs when touching another area
func _on_area_entered(area):
	# check if touching junk
	if area.name in ["wood", "bottle", "plastic", "pizza"]:
		# remove target junk
		if is_instance_valid(target):
			target.queue_free()

		# remove seagull
		queue_free()
