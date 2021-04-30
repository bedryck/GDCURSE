extends Node2D
var coin_taken = false;



func _on_Area2D_body_entered(body: Node) -> void:
	if(coin_taken): return;
	$AudioStreamPlayer2D.play()
	get_tree().call_group("Rules", "add_coin")
	$Area2D/Sprite.hide()
	$Timer.start()
	coin_taken = true;
	pass # Replace with function body.


func _on_Timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
