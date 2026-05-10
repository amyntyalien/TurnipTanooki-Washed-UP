extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/String.pressed.connect(_string)
	$Control/Wood.pressed.connect(_wood)
	$Control/Plastic.pressed.connect(_plastic)
	$Control/Bird.pressed.connect(_bird)
	$Control/Trade.pressed.connect(_trade)
	$Control/Warning.text = ""
	_string()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var current = {}
var num = 1


func _string():
	var dict = {"red":"string"}
	_tradable(dict)
	current = dict
	$Control/Goods.play("1")
	$Control/Selling.play("1")
	$Control/Cost.text = str(Inventory.feesh["red"])+"/1"
	num = 1

func _wood():
	var dict = {"pink":"wood"}
	_tradable(dict)
	current = dict
	$Control/Goods.play("2")
	$Control/Selling.play("2")
	$Control/Cost.text = str(Inventory.feesh["pink"])+"/1"
	num = 2

func _plastic():
	var dict = {"cyan":"plastic"}
	_tradable(dict)
	current = dict
	$Control/Goods.play("3")
	$Control/Selling.play("3")
	$Control/Cost.text = str(Inventory.feesh["cyan"])+"/1"
	num = 3

func _bird():
	var dict = {"purple":"bird"}
	_tradable(dict)
	current = dict
	$Control/Goods.play("4")
	$Control/Selling.play("4")
	$Control/Cost.text = str(Inventory.feesh["purple"])+"/1"
	num = 4

func _tradable(dict):
	$Control/Warning.text = ""
	for i in dict:
		if !(Inventory.feesh.has(i) and Inventory.feesh[i] > 0):
			$Control/Trade.disabled = true
			$Control/Warning.text = "Not enough matrial"
			return []
	$Control/Trade.disabled = false

func _trade():
	for i in current:
		Inventory.feesh[i] -= 1
		if current[i] == "bird":
			Inventory.multiplier += 1
			print(Inventory.multiplier)
		else:
			Inventory.trash[current[i]] += 1
	match num:
		1:
			_string()
		2:
			_wood()
		3:
			_plastic()
		4:
			_bird()

func _on_backtogame_pressed():
	get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")

func _on_inv_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/systems/inventory.tscn")


func _on_craft_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/systems/crafting.tscn")
