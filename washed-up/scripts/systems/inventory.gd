extends Node


var feesh = {
	"red":0,
	"pink":0,
	"cyan":0,
	"purple":0
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

var fish_colours = ["red", "pink", "cyan", "purple"]


var trash = {
	"wood":0
}

var rod = 0

func add_fish(item, amount):
	if item in fish_colours:
		if feesh.has(item):
			feesh[item] += amount
		else:
			feesh[item] = amount
	else:
		print("invalid fish")

func add_trash(item, amount):
	if trash.has(item):
		trash[item] += amount
	else:
		trash[item] = amount

func _on_backtogame_pressed():
	get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")


func _on_craft_button_pressed():
	get_tree().change_scene_to_file("res://scenes/systems/crafting.tscn")
