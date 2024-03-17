extends CanvasLayer

signal start_game

var score = 0
var start_scene = preload("res://node_2d.tscn").instantiate()
var game_ongoing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if game_ongoing:
		score += 1
		update_score(score)
	else:
		$ScoreLabel.hide()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Jetpack Joyride Clone"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)
	
func _on_start_button_pressed():
	print("start!")
	$StartButton.hide()
	$MessageLabel.hide()
	game_ongoing = true
	start_game.emit()
	get_tree().root.add_child(start_scene)
	#game_ongoing = true


func _on_barry_end_game():
	game_ongoing = false
	$ScoreLabel.hide()
	#show_game_over()
