extends CharacterBody2D

# play with gravity/speed values to simulate Jetpack Joyride-like physics
var gravity = 35
var move_dir = Vector2(0,-1)
var speed = 110
var on_ground = false
var pixel_threshold = 450

# used
# https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
# https://forum.godotengine.org/t/how-make-my-character-fall-gravity-in-kinematic-body-3d/17017/2
# https://www.reddit.com/r/godot/comments/15zg3b8/i_think_the_gravity_in_characterbody2d_default/
# https://www.reddit.com/r/godot/comments/13ntabo/hello_im_trying_to_make_a_simple_endless_runner/

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _get_input():
	if Input.is_action_pressed("up"):
		velocity += move_dir * speed
		on_ground = false
		#print(on_ground)
		
		# make sure player can't zoom off screen (beyond top of screen)
		if position.y < -1 * get_viewport().get_visible_rect().size.y + pixel_threshold:
			velocity += Vector2(0,1) * speed # remove previous velocity boost

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	#if on_ground:
	_get_input()
	
	 # NOTE: move_and_slide is smoother than move_and_collide (since delta is not accounted for)
	move_and_slide()
	
	# add gravity
	if not on_ground:
		velocity += Vector2(0, 1) * gravity # (10 m/s^2)
		

func _on_static_body_2d_player_on_floor():
	on_ground = true
	#print(on_ground)
