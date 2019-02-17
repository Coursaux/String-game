extends KinematicBody2D

func _input(event):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
   # Mouse in viewport coordinates
	if event is InputEventMouseMotion:
		set_position(event.position)
		print(event.position)