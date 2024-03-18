extends StaticBody2D

signal player_on_floor

var floor_x = position.x
var floor_y = position.y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var barry_y = get_node("../Barry").position.y
	if abs(barry_y - floor_y) < 10:
		player_on_floor.emit()


	# make sure that player can't clip out of bounds on left side
	var barry_x = get_node("../Barry").position.x
	if abs(barry_x - floor_x) < 10:
		get_node("../Barry").position.x += 10
