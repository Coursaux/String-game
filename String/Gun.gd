extends KinematicBody2D

var motion = Vector2()
var speedup = 0

func init(speed):
	speedup = speed
	$Bullets.wait_time = rand_range(0.8, 2);
	
func _ready():
	spawn()

func _physics_process(delta):
	motion.x = -300 - speedup
	var collision = move_and_collide(motion * delta)
	if collision:
		get_tree().change_scene("res://MainMenu.tscn")

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true

func spawn():
	var obstacle = preload("res://Bullet.tscn")
	var obstacleInstance = obstacle.instance()
	obstacleInstance.init(speedup)
	obstacleInstance.set_position(get_position())
	get_node("/root/Main").add_child(obstacleInstance)


func _on_Bullets_timeout():
	spawn()
