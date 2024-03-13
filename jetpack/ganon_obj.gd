class_name Ganon
extends CharacterBody2D

var initial_pos = position
const MOVE_SPEED = 200

#@onready var ganon_var = $enemy_ganon/Sprite2D

var frame_timer = 0

# https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html
# https://www.reddit.com/r/godot/comments/xp6ect/cant_seem_to_get_an_area2d_enemy_moving/
# https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _spawn_enemy(delta, frame_timer):
	#if frame_timer > 60: 
	#	var new_enemy = Ganon.new()
	#	get_node("..").add_child(new_enemy)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# move the obstacles towards the player at a constant rate
	# move_and_slide() helps enemy slide along staticbody2D
	velocity.x = -MOVE_SPEED
	move_and_slide()
	
	# if the enemy exits the screen, despawn it
	if position.x < -1 * get_viewport().get_visible_rect().size.x:
		print("past screen")
		queue_free()
		
	frame_timer += 1
	
	_spawn_enemy(delta, frame_timer)
