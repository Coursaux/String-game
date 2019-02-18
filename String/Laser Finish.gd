extends KinematicBody2D

var motion = Vector2(-1, 0)

func _ready():
	$LaserShoot.play()

func _physics_process(delta):
	if motion.x == 1:
		motion.x = -1
	else:
		motion.x = 1
	var collision = move_and_collide(motion * delta)
	if collision:
		get_tree().change_scene("res://Box Items/end.tscn")

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true
	$LaserShoot.stop()
