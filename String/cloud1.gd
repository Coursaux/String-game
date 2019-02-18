extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	motion.x = -100
	var collision = move_and_collide(motion * delta)

func _on_Timer_timeout():
	hide()
