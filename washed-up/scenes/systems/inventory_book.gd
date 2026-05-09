extends Sprite2D

var feesh = Inventory.feesh
var trash = Inventory.trash
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Rednum.text = str(feesh["red"])
	$Control/Pinknum.text = str(feesh["pink"])
	$Control/Cyannum.text = str(feesh["cyan"])
	$Control/Purplenum.text = str(feesh["purple"])
	$Control/Stringnum.text = str(trash["string"])
	$Control/Woodnum.text = str(trash["wood"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_ready()
	pass
