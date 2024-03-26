extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# my variables
@onready var _animation_player = $Sprite2D/AnimationPlayer
@onready var _sprite2d = $Sprite2D
var move_speed = 60

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		_animation_player.play("player_walk")
		position.y += delta * move_speed
		# 8, 6
	elif Input.is_action_pressed("ui_right"):
		_animation_player.play("walk_right")
		_sprite2d.set_flip_h(false)
		position.x += delta * move_speed
	elif Input.is_action_pressed("ui_left"):
		_sprite2d.set_flip_h(true)
		_animation_player.play("walk_right")
		position.x -= delta * move_speed
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("walk_up")
		position.y -= delta * move_speed
	else:
		_animation_player.stop()

"""
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
"""
