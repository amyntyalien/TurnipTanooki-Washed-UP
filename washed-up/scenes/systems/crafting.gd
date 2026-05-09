extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Rod1.pressed.connect(_rod1)
	$Control/Rod2.pressed.connect(_rod2)
	$Control/Rod3.pressed.connect(_rod3)
	$Control/Rod4.pressed.connect(_rod4)
	$Control/Craft_Button.pressed.connect(_craft)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var current = {}
var is_raft = false;

func _rod1():
	var dict = {"wood":3, "string":3}
	_craftable(dict)
	current = dict

func _rod2():
	var dict = {"wood":10, "string":10}
	_craftable(dict)
	current = dict

func _rod3():
	var dict = {"wood":30, "string":30}
	_craftable(dict)
	current = dict

func _rod4():
	var dict = {"wood":100, "string":100}
	_craftable(dict)
	current = dict

func _craftable(dict):
	for i in dict:
		if !(Inventory.feesh.has(i) and Inventory.feesh[i] > dict[i]):
			$Control/Craft_Button.disabled = true
			return []
	$Control/Craft_Button.disabled = false

func _craft():
	for i in current:
		Inventory.trash[i] = current[i]
	if is_raft:
		Inventory.raft += 1
	else:
		Inventory.item += 1
