extends KinematicBody2D

var things

# thing[0] = vector position
# thing[1] = rotation
func init(thing):
	things = thing
	$LaserCharge.play()

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true
	var obstacle = preload("res://Laser Finish.tscn")
	var obstacleInstance = obstacle.instance()
	obstacleInstance.set_position(things[0])
	obstacleInstance.set_rotation(things[1] + PI)
	get_node("/root/Main").add_child(obstacleInstance)
	$LaserCharge.stop()
