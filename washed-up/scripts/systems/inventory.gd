extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

var feesh = {
	"pink":0
}

var trash = {
	"wood":0
}

func add_fish(item, amount):
	if feesh.has(item):
		feesh[item] += amount
	else:
		feesh.assign({item: amount})

func add_trash(item, amount):
	if trash.has(item):
		trash[item] += amount
	else:
		trash.assign({item: amount})

func _on_backtogame_pressed():
	get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")


func _on_craft_button_pressed():
	get_tree().change_scene_to_file("res://scenes/systems/crafting.tscn")
