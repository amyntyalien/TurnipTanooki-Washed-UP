extends Control

func _on_new_game_pressed(): # New Game Texture Rect pressed
	get_tree().change_scene_to_file("res://scenes/core/cutscene.tscn")

func _on_continue_pressed():
	print("No game to continue from!") # Placeholder for when save files get added
	
func _on_options_pressed():
	print("No options for now!") # Another placeholder
	
func _on_quit_pressed():
	get_tree().quit() # Should exit the game
	
