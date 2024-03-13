extends Label

var cpupts = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var cpustr = "cpu points " + str(cpupts)
	horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	set_text(cpustr)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_2d_body_cpu_point_scored():
	cpupts += 1
	var cpustr = "cpu points " + str(cpupts)
	horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	set_text(cpustr)


func _on_new_game_notice_reset_points():
	cpupts = 0
	var cpustr = "cpu points " + str(cpupts)
	horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	set_text(cpustr)
