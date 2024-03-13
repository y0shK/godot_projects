extends StaticBody2D

signal player_on_floor

var floor_y = position.y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var barry_y = get_node("../Barry").position.y
	if abs(barry_y - floor_y) < 10:
		player_on_floor.emit()

