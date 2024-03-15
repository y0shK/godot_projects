extends CharacterBody2D

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
	
	if create_child_count < 5: # put N enemies on screen
		var ground_enemy = scene.instantiate()
		#instance.set_owner(get_tree().root)
		#get_tree().root.add_child(instance)
		add_child(ground_enemy)
		
		# set X and y values for position vector
		var y = get_node("../StaticBody2D").position.y
		var max_x = get_viewport().get_visible_rect().size.x
		var x = randi() % int(max_x)
		
		x_arr.append(x)
		#y_arr.append(y)
		# randi() % 
		
		# don't make the enemies too close to one another
		# if they are, move them back to give player more space
		if x_arr.size() >= 2 and abs(x_arr[-1] - x_arr[-2]) < 100:
			ground_enemy.global_position = Vector2(x + 100, y)
		else:
			ground_enemy.global_position = Vector2(x, y)
		create_child_count += 1
