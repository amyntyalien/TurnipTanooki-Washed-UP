extends Node2D

@onready var label = $Label # the label child node

var frame = 1
var timer = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false
	
	Inventory.cat = true
		
	await get_tree().create_timer(1.5).timeout # waiting 2 seconds
	
	label.visible = true # label now visible
	label.text = "Press F to skip the cutscene."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("skip_cutscene"):
		get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")
	if(timer == 125):
		timer = 0
		frame += 1
		if frame <= 10:
			$cutscene.play(str(frame))
		else:
			get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")
	timer+=1
