extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _craftable(dict):
	for i in dict:
		if !(Inventory.feesh.has(i) and Inventory.feesh[i] > dict[i]):
			return false
	return true

func _craft(dict):
	for i in dict:
		Inventory.feesh[i] -= dict[i]
