extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	motion.x = -1 
	var collision = move_and_collide(motion * delta)
	if collision:
		get_tree().change_scene("res://MainMenu.tscn")

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true