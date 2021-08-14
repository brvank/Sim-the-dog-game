extends KinematicBody2D
var speed = Vector2(0,0)
var limit = Vector2(0,0)
func _ready():
	pass
func _physics_process(delta):
	limit = position
	if limit.x>250:
		speed.x = -100
	elif limit.x<1:
		speed.x = 100
	speed=move_and_slide(speed)
