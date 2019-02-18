extends KinematicBody2D

var things

func _ready():
	spawnLaserStart()

func init(thing):
	things = thing
	
func spawnLaserStart():
	var obstacle = preload("res://LaserStart.tscn")
	var obstacleInstance = obstacle.instance()
	obstacleInstance.init(things)
	obstacleInstance.set_position(things[0])
	obstacleInstance.set_rotation(things[1] + PI)
	get_node("/root/Main").add_child(obstacleInstance)

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true
