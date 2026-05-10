extends Node2D

var combo = 0
var timer = 0
var start = false
var correct = false
var unanswered_count = 0

@onready var Question = $Background/Path2D/PathFollow2D/Cloud/Question
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_level()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if start:
		timer+=1
		$Timer.value = timer / 5
	if timer == 120:
		$Background/Character.play("idle")
	if timer == 500:
		combo = 0
		timer = 0
		unanswered_count += 1
		$Combo.text = "Combo X "+ str(combo)
		$Item.play("default")
		_level()
	$Answer.text = ans
	if correct:
		combo += 1
		timer = 0
		unanswered_count = 0
		$Combo.text = "Combo X "+ str(combo)
		get_fish()
		$Background/Path2D/PathFollow2D.progress_ratio = 0
		$Background/Character.play("fish")
		
		_level()
		correct = false
		ans = ""
		

var q_and_a

func _level():
	var x = $Mathquestions
	match Inventory.rod:
		0:
			q_and_a = x.generate_question_level_1()
		1:
			q_and_a = x.generate_question_level_2()
		2:
			q_and_a = x.generate_question_level_3()
		3:
			q_and_a = x.generate_question_level_4()
		4:
			q_and_a = x.generate_question_level_4()
		
	Question.text = q_and_a["question"]
	start = true
	pass

var ans = ""

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://scenes/core/gameworld.tscn")
		if event.keycode == KEY_MINUS && ans.length() == 0:
			ans += "-"
		if event.keycode == KEY_1:
			ans += "1"
		if event.keycode == KEY_2:
			ans += "2"
		if event.keycode == KEY_3:
			ans += "3"
		if event.keycode == KEY_4:
			ans += "4"
		if event.keycode == KEY_5:
			ans += "5"
		if event.keycode == KEY_6:
			ans += "6"
		if event.keycode == KEY_7:
			ans += "7"
		if event.keycode == KEY_8:
			ans += "8"
		if event.keycode == KEY_9:
			ans += "9"
		if event.keycode == KEY_0:
			ans += "0"
		if event.keycode == KEY_BACKSPACE || ans.length() > 5:
			ans = ans.left(ans.length()-1)
		if event.keycode == KEY_ENTER:
			if ans == "":
				unanswered_count += 1
				combo = 0
			else:
				if int(ans) == q_and_a["answer"]:
					correct = true
					unanswered_count = 0
				else:
					unanswered_count += 1
					combo = 0
					$Combo.text = "Combo X "+ str(combo)
			
			ans = ""
		
	


func get_fish():
	var x = randi_range(1,100)
	if x < 60 - Inventory.rod * 5:
		Inventory.add_fish("red", combo)
		$Item.play("red_fish")
	elif x < 80 - Inventory.rod * 5:
		Inventory.add_fish("pink", combo)
		$Item.play("pink_fish")
	elif x < 100 - Inventory.rod * 5:
		Inventory.add_fish("cyan", combo)
		$Item.play("cyan_fish")
	else:
		Inventory.add_fish("purple", combo)
		$Item.play("purple_fish")
