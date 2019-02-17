extends KinematicBody2D

# chance = percentage / 10 (eg. 5.0 = 50%)
var chance = 5.0
var motion = Vector2()

func _ready():
	var i = rand_range(1, 10)
	if i < chance:
		print("it's rewind time")

func _physics_process(delta):
	motion.x = -200
	move_and_slide(motion)

func _on_Timer_timeout():
	hide()
	$CollisionShape2D.disabled = true