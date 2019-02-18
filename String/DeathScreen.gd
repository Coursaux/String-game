extends MarginContainer

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var random = randi()%8+1
	
	# get_tree().change_scene("res://MainMenu.tscn")
