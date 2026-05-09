extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Rod1.pressed.connect(_rod1)
	$Control/Rod2.pressed.connect(_rod2)
	$Control/Rod3.pressed.connect(_rod3)
	$Control/Rod4.pressed.connect(_rod4)
	$Control/Craft_Button.pressed.connect(_craft)
	Inventory.add_trash("wood", 50)
	Inventory.add_trash("string", 50)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var current = {}
var level = 0

func _rod1():
	var dict = {"wood":3, "string":3}
	_craftable(dict)
	current = dict
	$Control/Rods.play("1")
	$Control/Cost1.text = "3/3"
	$Control/Cost2.text = "3/3"
	level = 1

func _rod2():
	var dict = {"wood":10, "string":10}
	_craftable(dict)
	current = dict
	$Control/Rods.play("2")
	$Control/Cost1.text = "10/10"
	$Control/Cost2.text = "10/10"
	level = 2

func _rod3():
	var dict = {"wood":30, "string":30}
	_craftable(dict)
	current = dict
	$Control/Rods.play("3")
	$Control/Cost1.text = "30/30"
	$Control/Cost2.text = "30/30"
	level = 3

func _rod4():
	var dict = {"wood":100, "string":100}
	_craftable(dict)
	current = dict
	$Control/Rods.play("4")
	$Control/Cost1.text = "100/100"
	$Control/Cost2.text = "100/100"
	level = 4

func _craftable(dict):
	print(JSON.stringify(Inventory.trash))
	for i in dict:
		if !(Inventory.trash.has(i) and Inventory.trash[i] >= dict[i]):
			$Control/Craft_Button.disabled = true
			return []
	$Control/Craft_Button.disabled = false

func _craft():
	for i in current:
		Inventory.trash[i] -= current[i]
	
	Inventory.item = level
