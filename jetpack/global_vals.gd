extends Node

"""
https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html

"""

var score = 0
#var start_scene = preload("res://node_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score += 1
