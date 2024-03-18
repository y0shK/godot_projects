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
var child_ct = 0
var barry_x = 100
#var my_root = get_tree().get_root().get_node(".")

var x_arr = []
#var y_arr = []

var can_spawn = true

var enemy_lim = 7
var refresh_enemies_rate = 4.0

func _physics_process(delta):
		#instance.set_owner(get_tree().root)
		#get_tree().root.add_child(instance)
	#add_child(enemy)
	
	# use groups 
	# add 5 to the screen
	# after a certain point, feel free to remove them
	# by creating an "enemy spawner" class with enemy.tscn,
	# apply that by adding each instantiated spawn to the group,
	# then subtract the instantiated spawn once it goes past the screen
	
	"""
	https://www.reddit.com/r/godot/comments/gr555s/wait_seconds_in_a_code/
	https://www.reddit.com/r/godot/comments/zrgs0n/remove_node_from_group_from_another_node_by/
	https://docs.godotengine.org/en/stable/tutorials/scripting/groups.html
	https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-add-to-group
	"""
	if len(get_tree().get_nodes_in_group("enemies")) < enemy_lim:
			var enemy = scene.instantiate()
			add_child(enemy)
			enemy.add_to_group("enemies")
		
			var enemy_type = randi() % 2
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
				
			await get_tree().create_timer(refresh_enemies_rate).timeout
			enemy.remove_from_group("enemies")
	
	"""
	if can_spawn:
		
		for i in range(4):
			var enemy = scene.instantiate()
		#instance.set_owner(get_tree().root)
		#get_tree().root.add_child(instance)
			add_to_group("enemies")
			#add_child(enemy)
			
			var enemy_type = randi() % 2
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
			
		can_spawn = false
	
		await get_tree().create_timer(5.0).timeout
	
	await get_tree().create_timer(10.0).timeout
	
	can_spawn = true
	"""
	
	"""
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
	"""
	pass
		
