extends CharacterBody2D

var gravity = 100
var move_dir = Vector2(0,-1)
var speed = 250
var on_ground = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _get_input():
	if Input.is_action_pressed("up"):
		velocity += move_dir * speed
		on_ground = false
		print(on_ground)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	#if on_ground:
	_get_input()
	move_and_slide() # NOTE: move_and_slide is smoother than move_and_collide (since delta is not accounted for)
	
	# add gravity
	if not on_ground:
		velocity += Vector2(0, 1) * gravity # (10 m/s^2)
		

func _on_static_body_2d_player_on_floor():
	on_ground = true
	print(on_ground)
