extends KinematicBody2D

func _input(event):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	# Mouse in viewport coordinates
	if event is InputEventMouseMotion:
		set_position(event.position)


func _physics_process(delta):
	var collision_info = move_and_collide(Vector2(0, 0))
	if collision_info:
		print(collision_info)
		var collision_point = collision_info.position
