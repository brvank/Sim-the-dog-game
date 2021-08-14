extends Area2D
signal won
func _ready():
	pass 

func _on_exit_body_entered(body):
	if body.is_in_group("group"):
		emit_signal("won")
