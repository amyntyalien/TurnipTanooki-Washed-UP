extends Node2D

var combo = 0
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_level1()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer+=1
	if timer == 10:
		combo = 0
	timer = 0
	pass

func _level1():
	var x = $Mathquestions
	print(x.generate_question_level_1())
	pass
