extends Area2D
signal score_counter

func _ready():
	pass

func _on_coins_body_entered(body):
	if body.is_in_group("group"):
		emit_signal("score_counter")
		queue_free()
