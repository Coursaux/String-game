extends KinematicBody2D

var shake_amount = 0.3

func _ready():
	$LaserShoot.play()

func _physics_process(delta):
	var collision = move_and_collide(Vector2(rand_range(-1.0, 1.0) * shake_amount, rand_range(-1.0, 1.0) * shake_amount))
	if collision:
		get_tree().change_scene("res://MainMenu.tscn")

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true
	$LaserShoot.stop()