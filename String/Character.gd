extends KinematicBody2D

func _input(event):
   # Mouse in viewport coordinates
	if event is InputEventMouseMotion:
		# set_position(event.position)
		var collision = move_and_collide(event.relative)
		if collision:
			get_tree().quit()
