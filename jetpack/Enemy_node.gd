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
var create_child = 0
#var my_root = get_tree().get_root().get_node(".")

func _physics_process(delta):
	
	if create_child < 3:
		var instance = scene.instantiate()
		#instance.set_owner(get_tree().root)
		#get_tree().root.add_child(instance)
		add_child(instance)
		instance.global_position = position
		create_child += 1
