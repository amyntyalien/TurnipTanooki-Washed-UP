#res://scenes/systems/crafting.gd:
extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Rod1.pressed.connect(_rod1)
	$Control/Rod2.pressed.connect(_rod2)
	$Control/Rod3.pressed.connect(_rod3)
	$Control/Rod4.pressed.connect(_rod4)
	$Control/Raft.pressed.connect(_raft) # connect this to gameworld.gd?
	$Control/Raft2.pressed.connect(_raft2)
	$Control/Craft_Button.pressed.connect(_craft)
	$Control/Warning.text = ""
	_lock()
	_rod1()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var current = {}
var level = 0
var is_raft = false

func _lock():
	if not Inventory.cat:
		$Control/Lockraft2.visible = true
		$Control/Raft2.disabled = true
	else:
		$Control/Lockraft2.visible = false
		$Control/Raft2.disabled = false
	match Inventory.rod:
		0:
			$Control/Lockpink.visible = true
			$Control/Rod2.disabled = true
			$Control/Lockcyan.visible = true
			$Control/Rod3.disabled = true
			$Control/Lockpurple.visible = true
			$Control/Rod4.disabled = true
			
		1:
			$Control/Lockpink.visible = false
			$Control/Rod2.disabled = false
			$Control/Lockcyan.visible = true
			$Control/Rod3.disabled = true
			$Control/Lockpurple.visible = true
			$Control/Rod4.disabled = true
			
		2:
			$Control/Lockpink.visible = false
			$Control/Rod2.disabled = false
			$Control/Lockcyan.visible = false
			$Control/Rod3.disabled = false
			$Control/Lockpurple.visible = true
			$Control/Rod4.disabled = true
			
		3:
			$Control/Lockpink.visible = false
			$Control/Rod2.disabled = false
			$Control/Lockcyan.visible = false
			$Control/Rod3.disabled = false
			$Control/Lockpurple.visible = false
			$Control/Rod4.disabled = false

func _raft():
	var dict = {"plastic":500, "wood":500}
	is_raft = true
	_craftable(dict)
	level = 0
	if Inventory.raft == 1:
		$Control/Warning.text = "Already owned"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("Raft")
	$Control/Input1.play("2")
	$Control/Cost1.text = str(Inventory.trash["wood"])+"/500"
	$Control/Cost2.text = str(Inventory.trash["plastic"])+"/500"
	
func _raft2():
	var dict = {"plastic":5000, "wood":5000}
	is_raft = true
	_craftable(dict)
	level = -1
	if Inventory.raft == 2:
		$Control/Warning.text = "Already owned"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("Raft2")
	$Control/Input1.play("2")
	$Control/Cost1.text = str(Inventory.trash["wood"])+"/5000"
	$Control/Cost2.text = str(Inventory.trash["plastic"])+"/5000"

func _rod1():
	var dict = {"wood":3, "string":3}
	is_raft = false
	_craftable(dict)
	if Inventory.rod >= 1:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("1")
	$Control/Input1.play("1")
	$Control/Cost1.text = str(Inventory.trash["string"])+"/3"
	$Control/Cost2.text = str(Inventory.trash["wood"])+"/3"
	level = 1

func _rod2():
	var dict = {"wood":10, "string":10}
	is_raft = false
	_craftable(dict)
	if Inventory.rod >= 2:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("2")
	$Control/Input1.play("1")
	$Control/Cost1.text = str(Inventory.trash["string"])+"/10"
	$Control/Cost2.text = str(Inventory.trash["wood"])+"/10"
	level = 2

func _rod3():
	var dict = {"wood":30, "string":30}
	is_raft = false
	_craftable(dict)
	if Inventory.rod >= 3:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("3")
	$Control/Input1.play("1")
	$Control/Cost1.text = str(Inventory.trash["string"])+"/30"
	$Control/Cost2.text = str(Inventory.trash["wood"])+"/30"
	level = 3

func _rod4():
	var dict = {"wood":100, "string":100}
	is_raft = false
	_craftable(dict)
	if Inventory.rod >= 4:
		$Control/Warning.text = "Already levelled"
		$Control/Craft_Button.disabled = true
		pass
	current = dict
	$Control/Rods.play("4")
	$Control/Input1.play("1")
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
	for i in current:
		Inventory.trash[i] -= current[i]
	if is_raft:
		if level == 0:
			Inventory.raft=1
		elif level == -1:
			Inventory.raft = 2
	else:
		Inventory.rod = level
	match level:
		-1:
			_raft2()
		0:
			_raft()
		1:
			_rod1()
		2:
			_rod2()
		3:
			_rod3()
		4:
			_rod4()
	_lock()
