
extends Label
var playerpts = 0
var cpu_pts = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	autowrap_mode = 1
	



func _on_ball_2d_body_human_point_scored():
	#playerpts += 1
	#var playerstr = "player points " + str(playerpts)
	#horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	#set_text("player scores")
	#set_text(playerstr)
	pass
	#await get_tree().create_timer(2.0).timeout
	#_on_ball_2d_body_respawn_start()

func _on_ball_2d_body_cpu_point_scored():
	#cpu_pts += 1
	#var cpustr = "cpu " + str(cpu_pts)
	#horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	#set_text("cpu scores")
	#set_text(cpustr)
	pass
	#await get_tree().create_timer(2.0).timeout
	#_on_ball_2d_body_respawn_start()


func _on_ball_2d_body_respawn_start():
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	set_text("starting new game!")
	await get_tree().create_timer(2.0).timeout
	set_text("") # get rid of label beyond a certain number of seconds
	
