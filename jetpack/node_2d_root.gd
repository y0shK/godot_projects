extends Node

class_name my_node

var score = 0
#var start_scene = preload("res://node_2d.tscn").instantiate()
var game_over_scene = preload("res://game_over.tscn").instantiate()
#var ui_scene = preload("res://ui.tscn").instantiate()

var score_inc = false

func game_over():
	#$ScoreTimer.stop()
	pass

func new_game():
	#print("new start")
	#score = 0
	#_on_hud_start_game()
	score_inc = true
	#$Player.start($StartPosition.position)
	#$StartTimer.start()

func _ready():
	new_game()

func _process(delta):
	
	if score_inc:
		score += 1

func _on_hud_start_game():
	print("hud start")
	#get_tree().root.add_child(start_scene)

func _on_barry_end_game():
	score_inc = false
	GlobalVals.score = score
	print("final score")
	print(score)
	#game_over()
	#get_tree().root.add_child(game_over_scene)
	get_parent().add_child(game_over_scene)
	queue_free()
	
#func return_score():
#	return score
