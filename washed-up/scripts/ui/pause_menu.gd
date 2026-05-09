extends Node
var SaveManager = "res://autoload/SaveManager.gd"
var player = "res://scenes/player/player.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_savepause_pressed():
	if player:
		SaveManager.save_game(player.global_position)
		print("Game Saved!")
	else:
		print("Player not found.")


func _on_optionspause_pressed():
	get_tree().change_scene_to_file("res://scenes/core/pauseoptions.tscn")


func _on_continuepause_pressed():
	get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")


func _on_title_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/core/titlescreen.tscn")
