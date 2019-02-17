extends MarginContainer

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Start_button_up():
	get_tree().change_scene("res://Main.tscn")


func _on_Quit_button_up():
	get_tree().quit()
