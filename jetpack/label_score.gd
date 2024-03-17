extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	#var my_score = my_node.return_score()
	get_node(".").set_text(str(22))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
