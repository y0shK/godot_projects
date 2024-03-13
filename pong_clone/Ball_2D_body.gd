extends Area2D

const DEFAULT_SPEED = 300

var speed = DEFAULT_SPEED

var rand_x = float(randi() % 360) / 6.28
var rand_y = float(randi() % 360) / 6.28
	#print(rand_x)
	
var direction = Vector2(rand_x, rand_y).normalized()
#direction.x = direction.x + rand_x
#direction.y = direction.y + rand_y
#direction = direction.normalized()

var initial_pos = position
var initial_dir = direction

var bounce_limit = 0
var max_bounce = 5

var human_points = 0
var cpu_points = 0

var pixel_threshold = 300

signal human_point_scored
signal cpu_point_scored
signal respawn_start
signal move_enemy

func _ready():
	randomize()
	
func _respawn():
	
	#get_tree().reload_current_scene()
	# on respawn, reset original position and direction vector
	position = initial_pos
	direction = initial_dir

func _process(delta):
	
	if Input.is_action_pressed("end"):
		respawn_start.emit()
		_respawn()
	
	speed += delta * 2
	position += speed * delta * direction
	#velocity = speed
	
	#if position.y < -1 * get_viewport_rect().size.y or position.y >= get_viewport_rect().size.y:
	if position.y <= -1 * get_viewport().get_visible_rect().size.y + pixel_threshold or position.y >= get_viewport().get_visible_rect().size.y - pixel_threshold:
	#if position.y <= pixel_threshold or position.y >= get_viewport().get_visible_rect().size.y - pixel_threshold:
		direction.y = direction.y * -1
		bounce_limit += 1
		
	elif position.x < -1 * get_viewport_rect().size.x or position.x >= get_viewport_rect().size.x:
		
		if position.x < -1 * get_viewport_rect().size.x:
			#human_points += 1
			human_point_scored.emit()
			
			#await get_tree().create_timer(2.0).timeout
			print("off bounds")
			print(position)
			#queue_free()
			_respawn() # when out of bounds, reset the stage and play again
		elif position.x > get_viewport_rect().size.x:
			#cpu_points += 1
			cpu_point_scored.emit()
			#await get_tree().create_timer(2.0).timeout
			print("off bounds")
			print(position)
			#queue_free()
			_respawn() # when out of bounds, reset the stage and play again
		#direction.x = direction.x * -1
		#bounce_limit += 1
		
		
		
	if bounce_limit >= max_bounce:
		speed = DEFAULT_SPEED
		
	
	#print("viewport")
	#print(get_viewport_rect().size.x)
	
	# this is how to get position of sibling node
	#if abs(position.x - get_node("../../Enemy/CharacterBody2D/CollisionShape2D").position.x) < 10 and abs(position.y - get_node("../../Enemy/CharacterBody2D/CollisionShape2D").position.y) < 10:
	#	print("pos close")
	
	var enemy_x = get_node("../../Enemy/CharacterBody2D/CollisionShape2D").position.x
	var enemy_y = get_node("../../Enemy/CharacterBody2D/CollisionShape2D").position.y
	if abs(position.x - enemy_x) < 50 or abs(position.y - enemy_y) < 30: # and abs(position.y - enemy_y) < 10:
		move_enemy.emit(position.y)
	

func reset():
	direction = Vector2.LEFT
	position = initial_pos
	speed = DEFAULT_SPEED

func _on_p_body_area_entered(area):
	
	
	
	#direction = direction.normalized()
	
	# add some randomness to the bounce
	var rand_x = float(randi() % 360) / 6.28
	var rand_y = float(randi() % 360) / 6.28
	#print(rand_x)
	print("before")
	print(direction)
	#
	
	
	#print(area.gravity_direction)
	
	# flip direction on player hit
	
	direction.x = direction.x + rand_x
	direction.y = direction.y + rand_y
	direction = -1 * direction
	
	print("diff")
	bounce_limit += 1
	
	direction = direction.normalized()
	
	print("after")
	print(direction)
	
	#direction = direction.normalized()
	print("touched player")


func _on_character_body_2d_area_entered(area):
	# flip direction on enemy hit
	direction = -1 * direction
	bounce_limit += 1
	
	# add some randomness to the bounce
	#var rand_x = float(randi() % 100) / 100.0
	#var rand_y = float(randi() % 100) / 100.0
	print("touched enemy")
	#print(rand_x)
	#direction.x = direction.x - rand_x
	#direction.y = direction.y - rand_y
