extends Node

var speedup = 1
var firstlaser = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	var screen_center = get_viewport().size / 2
	get_viewport().warp_mouse(screen_center)
	$character.set_mouse_position(screen_center)
	randomize()

func _on_Timer_timeout():
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

func _on_FirstLaser_timeout():
	firstlaser = true

func _on_Lasers_timeout():
	$Lasers.wait_time = rand_range(10, 25);
	if firstlaser:
		spawnlaser()

func spawnlaser():
	var obstacle = preload("res://LaserGun.tscn")
	var obstacleInstance = obstacle.instance()
	var random = randi()%8+1
	var things = getLocation(random)
	obstacleInstance.set_position(things[0])
	obstacleInstance.set_rotation(things[1])
	obstacleInstance.init(things)
	get_node("/root/Main").add_child(obstacleInstance)
	$timeToShake.start() 
	
func getLocation(random):
	var x = 0
	var y = 0
	var rotation = 0
	var things = []
	if random == 1:
		x = get_viewport().size.x / 4
		y = 60
		rotation = -0.5 * PI
	elif random == 2:
		x = get_viewport().size.x / 4
		x = x * 3
		y = 60
		rotation = -0.5 * PI
	elif random == 3:
		y = get_viewport().size.y / 4
		x = get_viewport().size.x - 60
	elif random == 4:
		y = get_viewport().size.y / 4
		y = y * 3
		x = get_viewport().size.x - 60
	elif random == 5:
		x = get_viewport().size.x / 4
		y = get_viewport().size.y - 60
		rotation = 0.5 * PI
	elif random == 6:
		x = get_viewport().size.x / 4
		x = x * 3
		y = get_viewport().size.y - 60
		rotation = 0.5 * PI
	elif random == 7:
		y = get_viewport().size.y / 4
		x = 60
		rotation = PI
	elif random == 8:
		y = get_viewport().size.y / 4
		y = y * 3
		x = 60
		rotation = PI
	var v = Vector2(x, y)
	things.append(v)
	things.append(rotation)
	return things

func _on_timeToShake_timeout():
	$Camera2D.startShake()
