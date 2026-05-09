extends Sprite2D

var feesh = Inventory.feesh
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Rednum.text = str(feesh["red"])
	$Control/Pinknum.text = str(feesh["pink"])
	$Control/Cyannum.text = str(feesh["cyan"])
	$Control/Purplenum.text = str(feesh["purple"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
