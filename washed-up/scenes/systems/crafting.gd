extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Rod1.pressed.connect(_Rod1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _Rod1():
	if _craftable({"wood":50}):
		$"Control/Craft Button".disabled = false
	else:
		$"Control/Craft Button".disabled = true
		
	
func _craftable(dict):
	for i in dict:
		if !(Inventory.feesh.has(i) and Inventory.feesh[i] > dict[i]):
			$"Control/Craft Button".disabled = false
			return []
	$"Control/Craft Button".disabled = true

func _craft(dict):
	for i in dict:
		Inventory.feesh[i] -= dict[i]
