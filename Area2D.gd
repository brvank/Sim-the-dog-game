extends KinematicBody2D
var speed = Vector2(0,0)
var limit = Vector2(0,0)

func _ready():
	speed.x = 100

# warning-ignore:unused_argument
func _physics_process(delta):
	limit = position
	if speed.x ==0:
		speed.x = 100
	elif limit.x>500:
		speed.x = -100
	elif limit.x<200:
		speed.x = 100
	speed=move_and_slide(speed)
