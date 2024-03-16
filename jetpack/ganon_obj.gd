class_name Ganon
extends CharacterBody2D

var initial_pos = position
const MOVE_SPEED = 200
var curr_enemies = 1

#@onready var ganon_var = $enemy_ganon/Sprite2D

var frame_timer = 0

# https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html
# https://www.reddit.com/r/godot/comments/xp6ect/cant_seem_to_get_an_area2d_enemy_moving/
# https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
# https://christinec-dev.medium.com/lets-learn-godot-4-by-making-an-rpg-part-11-spawning-enemy-ai-84fb1cccbc11
# https://github.com/christinec-dev/DustyTrails_RPG_Parts/blob/main/Part_11/Scripts/PickupSpawner.gd


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _spawn_enemy(delta, frame_timer, curr_enemies, max_enemies):
	
	if frame_timer > 400 and curr_enemies < max_enemies: 
		#print("frame timer >")
		var new_enemy = Ganon.new()
		#print(new_enemy)
		curr_enemies += 1
		#new_enemy.position = initial_pos
		#new_enemy
		var my_root = get_tree().get_root().get_node("Node2D")
		
		#print(curr_enemies)
		my_root.add_child(new_enemy)
		new_enemy.set_owner(my_root)
	
		if new_enemy.position.x <= -1 * get_viewport().get_visible_rect().size.x:
			new_enemy.queue_free()
			curr_enemies -= 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# move the obstacles towards the player at a constant rate
	# move_and_slide() helps enemy slide along staticbody2D
	velocity.x = -MOVE_SPEED
	move_and_slide()
		
	#frame_timer += 1
	#print(frame_timer)
	
	#var new_enemy = _spawn_enemy(delta, frame_timer, curr_enemies, 5)
