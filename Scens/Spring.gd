extends Area2D



func _on_Spring_body_entered(body: Node) -> void:
	body.boost()
	$AudioStreamPlayer.play()
	$Sprite.texture = load("res://assets/Graphics/Items/springboardUp.png")
	$Timer.start()
	pass # Replace with function body.


func _on_Timer_timeout() -> void:
	$Sprite.texture = load("res://assets/Graphics/Items/springboardDown.png")
	pass # Replace with function body.
