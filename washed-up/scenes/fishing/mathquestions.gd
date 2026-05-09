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
	
func generate_question_level_3():
	var question_type = randi_range(0, 1)
	
	match question_type:
		0:
			var x = randi_range(1, 10)
			var a = randi_range(1, 10)
			var random = randi_range(0, 3)
			var operations = [_add, _minus, _multi, _div]
			if random == 3:
				a = a * x
			var result = operations.get(random).call(a, x)
			var operation_symbols = ['+', '-', '*', '/']
			
			return{
				"question": str(a) + " "+operation_symbols.get(random)+" x = " + str(result),
				"answer": x
			}
		
		1:
			var size = randi_range(0, 1)
			match size:
				0:
					var base = randi_range(6, 10)
					var answer = pow(base, 2)
					
					return{
						"question": str(base) + "^" + str(2),
						"answer": answer
					}
				1:
					var base = randi_range(2, 5)
					var power = randi_range(2, 4)
					var answer = pow(base, power)
					
					return{
						"question": str(base) + "^" + str(power),
						"answer": answer
					}
	
	return{}


func generate_question_level_4():
	var start = randi_range(-100, 100)
	var power = randi_range(1,2)
	var q = ""
	match power:
		1:
			var move = randi_range(-30,30)
			for i in range (5):
				q += (str(start) + ", ")
				start += move
			q += ("?")
			return {"question": q, "answer": start}
		2:
			var move1 = randi_range(-10,10)
			var move2 = randi_range(-5,5)
			for i in range (5):
				q += (str(start) + ", ")
				start += move1
				move1 += move2
			q += ("?")
			return {"question": q, "answer": start}
	return{}
