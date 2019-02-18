extends KinematicBody2D

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true