extends PathFollow2D

var speed = 0.0001

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += delta*0.12
