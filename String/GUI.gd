extends MarginContainer

var score = 0

func _process(delta):
	$HBoxContainer/VBoxContainer/CenterContainer/HBoxContainer/Label.text = str(score)

func _on_Timer_timeout():
	score += 1
