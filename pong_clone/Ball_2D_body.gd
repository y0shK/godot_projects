extends Area2D

const DEFAULT_SPEED = 200

var speed = DEFAULT_SPEED
var direction = Vector2.RIGHT

var initial_pos = position

var bounce_limit = 0
var max_bounce = 5

var human_points = 0
var cpu_points = 0

signal human_point_scored
signal cpu_point_scored

func _ready():
	randomize()

func _process(delta):
	speed += delta * 2
	position += speed * delta * direction
	#velocity = speed
	
	if position.y < 0 or position.y >= get_viewport_rect().size.y:
		direction = direction * -1
		bounce_limit += 1
		
		
		
		
	elif position.x < 0 or position.x >= get_viewport_rect().size.x:
		
		if position.x < 0:
			human_points += 1
			human_point_scored.emit()
		else:
			cpu_points += 1
			cpu_point_scored.emit()
		direction = direction * -1
		bounce_limit += 1
		
	if bounce_limit >= max_bounce:
		speed = DEFAULT_SPEED
		
	
	#print("viewport")
	#print(get_viewport_rect().size.x)
	

func reset():
	direction = Vector2.LEFT
	position = initial_pos
	speed = DEFAULT_SPEED

func _on_p_body_area_entered(area):
	
	
	
	#direction = direction.normalized()
	
	# add some randomness to the bounce
	var rand_x = float(randi() % 100) / 100.0
	var rand_y = float(randi() % 100) / 100.0
	#print(rand_x)
	print("before")
	print(direction)
	#
	
	
	#print(area.gravity_direction)
	
	# flip direction on player hit
	direction = -1 * direction
	
	print("diff")
	bounce_limit += 1
	#direction.x = abs(direction.x + rand_x)
	#direction.y = abs(direction.y + rand_y)
	
	print("after")
	print(direction)
	
	#direction = direction.normalized()
	print("touched player")


func _on_character_body_2d_area_entered(area):
	# flip direction on enemy hit
	direction = -1 * direction
	bounce_limit += 1
	
	# add some randomness to the bounce
	var rand_x = float(randi() % 100) / 100.0
	var rand_y = float(randi() % 100) / 100.0
	#print(rand_x)
	#direction.x = direction.x - rand_x
	#direction.y = direction.y - rand_y
