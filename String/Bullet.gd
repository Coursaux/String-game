extends KinematicBody2D

var motion = Vector2()
var speedup = 0

func init(speed):
	speedup = speed

func _physics_process(delta):
	motion.x = -600 - speedup
	var collision = move_and_collide(motion * delta)
	if collision:
		get_tree().change_scene("res://DeathScreen.tscn")

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true