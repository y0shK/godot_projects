extends Label

# https://www.reddit.com/r/godot/comments/gprfoa/printing_variables_in_label_text/


# Called when the node enters the scene tree for the first time.
func _ready():
	#var my_score = my_node.return_score()
	#get_node(".").set_text(str(22))
	get_node(".").set_text("Final score: " + str(GlobalVals.score))
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
