extends Node

func generate_question():
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
