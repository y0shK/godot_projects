extends Area2D

var initial_pos = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if abs(position.x - get_node("../../Ball/Ball_2D_body/CollisionShape2D").position.x) < 1:
		print("pos close enemy")


func _on_ball_2d_body_move_enemy(ball_y):
	if position.y < ball_y:
		position.y += 30
	else:
		position.y -= 30
