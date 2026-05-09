extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Rod1.pressed.connect(_rod1)
	$Control/Rod2.pressed.connect(_rod2)
	$Control/Rod3.pressed.connect(_rod3)
	$Control/Rod4.pressed.connect(_rod4)
	$Control/Craft_Button.pressed.connect(_craft)
	$Control/Warning.text = ""
	_rod1()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var current = {}
var level = 0

func _rod1():
	var dict = {"wood":3, "string":3}
	_craftable(dict)
	if Inventory.rod >= 1:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("1")
	$Control/Cost1.text = str(Inventory.trash["string"])+"/3"
	$Control/Cost2.text = str(Inventory.trash["wood"])+"/3"
	level = 1

func _rod2():
	var dict = {"wood":10, "string":10}
	_craftable(dict)
	if Inventory.rod >= 2:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("2")
	$Control/Cost1.text = str(Inventory.trash["string"])+"/10"
	$Control/Cost2.text = str(Inventory.trash["wood"])+"/10"
	level = 2

func _rod3():
	var dict = {"wood":30, "string":30}
	_craftable(dict)
	if Inventory.rod >= 3:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("3")
	$Control/Cost1.text = str(Inventory.trash["string"])+"/30"
	$Control/Cost2.text = str(Inventory.trash["wood"])+"/30"
	level = 3

func _rod4():
	var dict = {"wood":100, "string":100}
	_craftable(dict)
	if Inventory.rod >= 4:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("4")
	$Control/Cost1.text = str(Inventory.trash["string"])+"/100"
	$Control/Cost2.text = str(Inventory.trash["wood"])+"/100"
	level = 4

	

func _craftable(dict):
	$Control/Warning.text = ""
	for i in dict:
		if !(Inventory.trash.has(i) and Inventory.trash[i] >= dict[i]):
			$Control/Craft_Button.disabled = true
			$Control/Warning.text = "Not enough matrial"
			return []
	$Control/Craft_Button.disabled = false

func _craft():
	if $Control/Warning.text == "Already levelled":
		pass
	for i in current:
		Inventory.trash[i] -= current[i]
	Inventory.rod = level
	match level:
		1:
			_rod1()
		2:
			_rod2()
		3:
			_rod3()
		4:
			_rod4()
