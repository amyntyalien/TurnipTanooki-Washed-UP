#res://scripts/core/game_world.gd:
extends Node2D

var junk_scene = preload("res://scenes/entities/junk.tscn")
var seagull_scene = preload("res://scenes/entities/seagull.tscn")

# Timer node
@onready var timer = $JunkTimer
@onready var fishing_area = $fishingTransition # Get reference to the fishing area

# runs when scene starts
func _ready():
	timer.wait_time = 4.0 # timer delay
	timer.one_shot = false # loop forever
	timer.timeout.connect(_on_junk_timer_timeout) # connect timer
	timer.start() # start timer
	
	# Connect the signal to detect when the player enters
	fishing_area.body_entered.connect(_on_fishing_Transition_body_entered)

	# change raft visibility here? If Inventory.raft = 0, then there is no raft. If Inventory.raft = 1, there is a raft.
	var raft_node = get_node_or_null("Raft")
	if raft_node:
		raft_node.visible = Inventory.raft == 1
		$raftTransition/Sprite2D.visible = true
	
	
	if !Inventory.cat:
		$CatPath.visible = false
	
	if Inventory.raft<2:
		$boatTransition.visible = false

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

# Define the function to change scene
func _on_fishing_Transition_body_entered(body):
	# Assumes your player node is in a group called "player" 
	# or named "Player"
	if body.name == "player" or "Player":
		get_tree().change_scene_to_file("res://scenes/fishing/fishgame.tscn")

# runs every frame
func _process(_delta):
	# open pause menu
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/core/pause.tscn")
	
	# open inventory
	if Input.is_action_just_pressed("inventory"):
		get_tree().change_scene_to_file("res://scenes/systems/inventory.tscn")


# change raft visibility here? If Inventory.raft = 0, then there is no raft. If Inventory.raft = 1, there is a raft.
# or use the is_raft variable?
func _on_raft_transition_body_entered(body: Node2D) -> void:
	if Inventory.raft < 1:
		$boatTransition/Sprite2D.visible = false
		return
	else :
		$boatTransition/Sprite2D.visible = true
	
	if $Player/CharacterBody2D/AnimatedSprite2D.animation != "fall":
		get_tree().change_scene_to_file("res://scenes/boss_fights/boss.tscn")


func _on_boat_transition_body_entered(body: Node2D) -> void:
	if Inventory.raft < 2:
		$boatTransition/Sprite2D.visible = false
		return
	else :
		$boatTransition/Sprite2D.visible = true
	
	if $Player/CharacterBody2D/AnimatedSprite2D.animation != "fall":
		get_tree().change_scene_to_file("res://scenes/core/EndCutscene.tscn")
