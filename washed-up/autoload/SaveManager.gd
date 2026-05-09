extends Node

const SAVE_PATH = "user://savegame.save" # making a save path

func save_game(player_position: Vector2): # saves the player position
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE) # opens the save file
	# all the player data
	var data = {
		"x": player_position.x, "y": player_position.y # just player position atm
	}
	file.store_var(data)
	file.close()

func load_game():
	if !FileAccess.file_exists(SAVE_PATH): # check if file is not there
		return{}
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var data = file.get_var()
	
	file.close()
	return data

func has_save() -> bool:
	return FileAccess.file_exists(SAVE_PATH)
