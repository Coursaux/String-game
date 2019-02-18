extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var random = randi()%10+1
	var obstacle = preload("res://Box Items/bird.tscn")
	if random == 2:
		obstacle = preload("res://Box Items/Box.tscn")
	elif random == 3:
		obstacle = preload("res://Box Items/Dynamite.tscn")
	elif random == 4:
		obstacle = preload("res://Box Items/flappy.tscn")
	elif random == 5:
		obstacle = preload("res://Box Items/lazer.tscn")
	elif random == 6:
		obstacle = preload("res://Box Items/logo.tscn")
	elif random == 7:
		obstacle = preload("res://Box Items/memes.tscn")
	elif random == 8:
		obstacle = preload("res://Box Items/rupee.tscn")
	elif random == 9:
		obstacle = preload("res://Box Items/torpedo.tscn")
	elif random == 10:
		obstacle = preload("res://Box Items/Watermelon.tscn")
	var obstacleInstance = obstacle.instance()
	#obstacleInstance.set_position(get_viewport().size/2)
	get_node("/root/end").add_child(obstacleInstance)


func _on_Timer_timeout():
	get_tree().change_scene("res://MainMenu.tscn")
