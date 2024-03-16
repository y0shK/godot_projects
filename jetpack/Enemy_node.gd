extends Area2D

# this tree node takes a previous characterBody2D class
# and creates arbitrarily many objects based on it

"""
var scene = preload("res://Enemy.tscn")

var instance = scene.instantiate()

func _process(delta):
	get_tree().current_scene.add_child(instance)
"""

# https://www.reddit.com/r/godot/comments/hstqtk/cant_add_child_node2d_to_world_already_has_a/
# https://www.reddit.com/r/godot/comments/15aekm9/help_for_create_and_use_nodes_in_script_without/
# https://docs.godotengine.org/en/latest/tutorials/scripting/nodes_and_scene_instances.html#instancing-scenes

# https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html
# https://www.reddit.com/r/godot/comments/xp6ect/cant_seem_to_get_an_area2d_enemy_moving/
# https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
# https://christinec-dev.medium.com/lets-learn-godot-4-by-making-an-rpg-part-11-spawning-enemy-ai-84fb1cccbc11
# https://github.com/christinec-dev/DustyTrails_RPG_Parts/blob/main/Part_11/Scripts/PickupSpawner.gd

var scene = preload("res://Enemy.tscn")
var create_child_count = 0
#var my_root = get_tree().get_root().get_node(".")

var x_arr = []
#var y_arr = []

func _physics_process(delta):
	
	if create_child_count < 10: # put N enemies on screen
		
		var enemy_type = randi() % 2
		#print(enemy_type)
		
		var enemy = scene.instantiate()
		#instance.set_owner(get_tree().root)
		#get_tree().root.add_child(instance)
		add_child(enemy)
		
		# set X and y values for position vector
		var y = get_node("../StaticBody2D").position.y
		var max_x = get_viewport().get_visible_rect().size.x
		var x = randi() % int(max_x) - 30
		
		x_arr.append(x)
		#y_arr.append(y)
		# randi() % 
		
		# decide whether enemy is ground, in middle, or on top with enemy_type var
		# if aerial, add to the y component
		y -= 250 * enemy_type + 150 # y=-150 is ground, and y=-400 is top
			
		print("pos")
		print(y)
	
		# don't make the enemies too close to one another
		# if they are, move them back to give player more space
		if x_arr.size() >= 2 and abs(x_arr[-1] - x_arr[-2]) < 150:
			enemy.global_position = Vector2(x + 150, y)
		else:
			enemy.global_position = Vector2(x, y)
		create_child_count += 1
		
		#var player_x = get_node("../Barry").position.x
		#var player_y = get_node("../Barry").position.y
	
		# DON'T WORK
		#if abs(player_x - x_arr[-1]) < 5 and abs(player_y - y) < 5:
		#player_is_hit.emit()
		
		# Used area2D signal instead
		#if abs(player_x - x_arr[-1]) < 5 and abs(player_y - y) < 5:
		#	print("Barry died")
		
