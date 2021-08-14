extends KinematicBody2D
signal lose
var gravity = 1900
var motion =Vector2(0,0)
var up = Vector2(0,-1)
onready var sprite = get_node("Sprite")
var audio = preload("res://audio.tscn")
var aud = audio.instance()
func _ready():
	pass

func _physics_process(delta):
	motion.x=0
	motion.y += gravity*delta
	if is_on_floor():    #statement is true if normarl vector of the is_on_ceiling function matches with the normal to the contact surface of the kinematic body, decided by the up vector2d variable.
		if Input.is_action_just_pressed("ui_up"):
			motion.y=-800
	if Input.is_action_pressed("ui_left"):
		motion.x=-400
	if Input.is_action_pressed("ui_right"):
		motion.x=400
	motion=move_and_slide(motion,up)    #here up vector2d variable decides wheter the contact surface is floor or wall or ceiling(by deciding the normal to that surface), required that this kinematic body should be on a static one.
	animation()
	position_checking()

func animation():
	if motion.y<0:
		sprite.play("jump")
	if motion.x>0:
		sprite.play("run")
	if motion.x<0:
		sprite.play("run")
	if motion.x==0:
		sprite.play("idle")

func position_checking():
	var posc = position
	if posc.y >900:
		aud.stop()
		emit_signal("lose")

func _on_movingObject_lose():
	get_tree().quit()
