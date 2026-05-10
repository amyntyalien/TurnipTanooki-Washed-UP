extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventory.cat = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
