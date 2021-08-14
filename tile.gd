extends Node2D
var score=0

func _ready():
	yield(get_tree().create_timer(0.2),"timeout")
	$AudioStreamPlayer2D.play()
	pass 

func _on_coins_score_counter():
	score += 1
	get_node("CanvasLayer/Label").text = "score:"+String(score)

func _on_exit_won():
	$AudioStreamPlayer2D.stop()
	if score==1:
		get_node("CanvasLayer/Label3").text ="won with only one star!!!\nnow move to exit point"
	if score==2:
		get_node("CanvasLayer/Label3").text ="won with two stars...not bad\nnow move to exit point"
	if score==3:
		get_node("CanvasLayer/Label3").text ="won...hurrah.\nnow move to exit point."
	if score==4:
		get_node("CanvasLayer/Label3").text ="you are a great player.\nnow move to exit point."
