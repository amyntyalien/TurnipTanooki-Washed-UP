extends Node

# Reference to the junk scene
var junk_scene = preload("res://scenes/entities/junk.tscn")
@onready var timer = $JunkTimer # Assumes a Timer node exists as a child

func _ready() -> void:
	# Set up the timer to loop every 60 seconds
	timer.wait_time = 60.0
	timer.one_shot = false # Makes it looooop
	timer.timeout.connect(_on_junk_timer_timeout)
	timer.start()

func _on_junk_timer_timeout() -> void:
	# Instance and add the scene
	var instance = junk_scene.instantiate()
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/core/pause.tscn")
	if Input.is_action_just_pressed("inventory"):
		get_tree().change_scene_to_file("res://scenes/systems/inventory.tscn")
