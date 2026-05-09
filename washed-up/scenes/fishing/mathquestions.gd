extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_question_level_1():
	var a = randi_range(1, 10)
	var b = randi_range(1, 10)
	var operation = randi_range(0, 3)
	
	match operation:
		0:
			return{
				"question": str(a) + " + " + str(b), "answer": a + b
			}
		1:
			if b > a:
				var temp = a
				a = b
				b = temp
			return{
				"question": str(a) + " - " + str(b), "answer": a - b
			}
		2:
			return{
				"question": str(a) + " x " + str(b), "answer": a * b
			}
		3:
			var answer = randi_range(1, 10)
			var divisor = randi_range(1, 10)
			return{
				"question": str(answer * divisor) + " / " + str(divisor), "answer": answer
			}
	return{}


func _add(x, y):
	return x+y
func _minus(x, y):
	return x-y
func _multi(x, y):
	return x*y
func _div(x, y):
	return x/y


func generate_question_level_2():
	var a = randi_range(1, 10)
	var b = randi_range(1, 10)
	var c = randi_range(1, 10)
	var order = randi_range(0, 1)
	var operations = [_add, _minus, _multi, _div]
	var operation_symbols = ['+', '-', '*', '/']
	var operation_a = randi_range(0, 2)
	var operation_b = randi_range(0, 2)
	
	match order:
		0:
			var ans = 0
			ans = operations.get(operation_a).call(a, b)
			ans = operations.get(operation_b).call(ans, c)
			return{
				"question": "(" + str(a) + " " + operation_symbols.get(operation_a) + " " 
				+ str(b) + ") " + operation_symbols.get(operation_b) + " " + str(c), "answer": ans
			}
		1:
			var ans = 0
			ans = operations.get(operation_b).call(b, c)
			ans = operations.get(operation_a).call(a, ans)
			return{
				"question": str(a) + " " + operation_symbols.get(operation_a) + " (" 
				+ str(b) + " " + operation_symbols.get(operation_b) + " " + str(c) + ")", "answer": ans
			}
	return{}
	
