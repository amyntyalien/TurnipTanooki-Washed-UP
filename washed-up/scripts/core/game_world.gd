# game_world.gd:
extends Node2D
var junk_scene = preload("res://scenes/entities/junk.tscn")
var seagull_scene = preload("res://scenes/entities/seagull.tscn")

# get timer node
@onready var timer = $JunkTimer

# runs when scene starts
func _ready():
	timer.wait_time = 10.0 # timer delay
	timer.one_shot = false # loop forever
	timer.timeout.connect(_on_junk_timer_timeout) # connect timer
	timer.start() # start timer

# runs when timer ends
func _on_junk_timer_timeout():
	# create junk
	var junk_instance = junk_scene.instantiate()

	# add junk to world
	add_child(junk_instance)

	# random junk position
	junk_instance.position = Vector2(
		randi_range(100, 900),
		randi_range(100, 500)
	)

	# create seagull
	var seagull = seagull_scene.instantiate()
	add_child(seagull)
	seagull.position = Vector2(-100, 100) # starting position

	# assign target
	seagull.set_target(junk_instance)

# runs every frame
func _process(_delta):
	# open pause menu
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/core/pause.tscn")

	# open inventory
	if Input.is_action_just_pressed("inventory"):
		get_tree().change_scene_to_file("res://scenes/systems/inventory.tscn")
