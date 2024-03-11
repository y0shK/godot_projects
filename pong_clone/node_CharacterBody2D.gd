class_name PLAYER
extends Area2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var input_direction = Vector2.LEFT

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		# Move right.
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
