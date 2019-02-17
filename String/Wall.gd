extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	motion.x = -200
	move_and_slide(motion)

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true