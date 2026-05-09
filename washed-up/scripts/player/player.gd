extends CharacterBody2D

@export var speed = 400
@onready var _animated_sprite = $AnimatedSprite2D # Animated Sprite 2d commands

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	# Handle Animations
	if input_direction.length() > 0:
		if input_direction.x > 0:
			_animated_sprite.play("walk right")
		elif input_direction.x < 0:
			_animated_sprite.play("walk left")
		elif input_direction.y > 0:
			_animated_sprite.play("walk down")
		elif input_direction.y < 0:
			_animated_sprite.play("walk up")
	else:
		if (_animated_sprite.animation == "fall"):
			_animated_sprite.play("fall")
		else:
			_animated_sprite.play("idle")

func _physics_process(delta):
	get_input()
	move_and_slide()
