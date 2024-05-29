extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var move_speed = 90

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var wrap = false

func _process(delta):
	var max_pos = get_viewport().get_visible_rect().size.x
	print(max_pos)
	
	print("curr pos", position.x)
	
	if Input.is_action_pressed("ui_right"):
		position.x += delta * move_speed
	elif Input.is_action_pressed("ui_left"):
		position.x -= delta * move_speed
	elif Input.is_action_pressed("ui_up"):
		position.y -= delta * move_speed
	elif Input.is_action_pressed("ui_down"):
		position.y += delta * move_speed
	move_and_collide(Vector2(0,0))
	
	# implement wrap-around
	if position.x < (-1 * max_pos) / 2 and wrap == false:
		print("small overflow")
		position.x = 1 * max_pos / 2
		wrap = true
	elif position.x >= max_pos / 2 and wrap == false:
		print("big overflow")
		position.x = -1 * max_pos / 2
		wrap = true
		
	wrap = false
