extends Area2D

var target_pos = Vector2(512, 300) # change this to go to whereever the junk is
var speed = 300
var junk_scene = "res://scenes/entities/junk.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#need this to randomly spawn
# go towards an item of junk
#then despawn after colliding with junk

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(target_pos, speed * delta) # constantly moving towards junk
	
func _on_body_entered(body): # check body
	if body.is_in_group("junk"):
		queue_free() # exit
