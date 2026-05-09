extends Node2D

@onready var label = $Label # the label child node

# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false
	
	await get_tree().create_timer(3.0).timeout # waiting 3 seconds
	
	label.visible = true # label now visible
	label.text = "Press F to skip the cutscene."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("skip_cutscene"):
		get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")
