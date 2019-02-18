extends Camera2D
    # Animate this to increase/decrease/fade the shaking
var shake_amount = 10
var shake = false
var offsets 

func _ready():
	offsets = get_offset()

func _process(delta):
	if shake:
		set_offset(Vector2(rand_range(-1.0, 1.0) * shake_amount, rand_range(-1.0, 1.0) * shake_amount))

func startShake():
	shake = true
	$ShakeTime.start()

func _on_ShakeTime_timeout():
	shake = false
	set_offset(offsets)