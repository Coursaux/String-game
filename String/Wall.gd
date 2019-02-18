extends KinematicBody2D

var motion = Vector2()
var speedup = 0

func init(speed):
	speedup = speed

func _physics_process(delta):
	motion.x = -300 - speedup
	var collision = move_and_collide(motion * delta)
	if collision:
		get_tree().change_scene("res://Box Items/end.tscn")

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true

func _ready():
	var rand = rand_range(1, 7)
	if rand >= 6:
		spawn()

func spawn():
	var obstacle = preload("res://Gun.tscn")
	var obstacleInstance = obstacle.instance()
	obstacleInstance.init(speedup)
	var position = get_position()
	position.x = position.x - 60
	obstacleInstance.set_position(position)
	get_node("/root/Main").add_child(obstacleInstance)