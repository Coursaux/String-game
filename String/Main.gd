extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speedup = 1

func _ready():
	pass
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	var screen_center = get_viewport().size / 2
	get_viewport().warp_mouse(screen_center)
	$character.set_mouse_position(screen_center)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Timer_timeout():
	randomize()
	spawn()
	$Spawn.wait_time = rand_range(0.5, 3);
	

func _physics_process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()

func spawn():
	var obstacle = preload("res://Wall.tscn")
	var obstacleInstance = obstacle.instance()
	obstacleInstance.init(speedup)
	var random = Vector2(1024, rand_range(0, 500))
	obstacleInstance.set_position(random)
	get_node("/root/Main").add_child(obstacleInstance)

func _on_Speedup_timeout():
		speedup = speedup + 3
