extends Button
var start_scene = preload("res://node_2d.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_retry_button_pressed():
	get_node("../CanvasLayer/Sprite2D").hide()
	get_node("../CanvasLayer/Label").hide()
	#get_tree().root.add_child(GlobalVals.start_scene)
	get_tree().root.add_child(start_scene.instantiate())
	queue_free()
	#pass
