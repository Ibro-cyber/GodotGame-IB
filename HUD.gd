extends CanvasLayer
signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func _show_game_over():
	_show_message("Game Over")
	yield($MessageTimer, "timeout")
	$Message.text = "Dodge the /nCreeps!"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func _update_score(score): 
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
