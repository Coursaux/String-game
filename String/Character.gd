extends KinematicBody2D


# all for positions
var absolute_override = Vector2(0, 0)
var previous = Vector2(0, 0)
var current = Vector2(0, 0)

func _ready():
	$Wings.play()

func _input(event):
   # Mouse in viewport coordinates
	if event is InputEventMouseMotion:
		#relative = event.relative
		current = event.position

func set_mouse_position(custom_absolute):
	absolute_override = custom_absolute

func _physics_process(delta):
	if absolute_override:
		set_position(absolute_override)
		#print("absolute_override", absolute_override)
		previous = absolute_override
		absolute_override = Vector2(0, 0)
		print(previous)
	
	elif current:
		var relative = current - previous
		var collision = move_and_collide(relative)
		if collision:
			get_tree().change_scene("res://Box Items/end.tscn")
		previous = current
		current = Vector2(0, 0)
	