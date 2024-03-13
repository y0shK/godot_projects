extends Label

var playerpts = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_2d_body_human_point_scored():
	playerpts += 1
	var playerstr = "player points " + str(playerpts)
	horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	set_text(playerstr)
	
