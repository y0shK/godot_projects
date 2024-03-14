extends CharacterBody2D

"""
var scene = preload("res://Enemy.tscn")

var instance = scene.instantiate()

func _process(delta):
	get_tree().current_scene.add_child(instance)
"""

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
