extends Node

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

func generate_question_level_2():
	var order = randi_range(0, 2)
	var operations = ['+', '-', '*', '/']
	operations.get(1).work = function(){print("a")}
	var operation_a = operations.get(randi_range(0, 3))
	var operation_b = operations.get(randi_range(0, 3))
	var a = randi_range(1, 10)
	var b = randi_range(1, 10)
	var c = randi_range(1, 10)
	
	match order:
		0:
			var ans = 0
			
			return{
				"question": str(a) + " " + operation_a + " " 
				+ str(b) + operation_b + " " + str(c), "answer": a + b
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
	return{}
	
