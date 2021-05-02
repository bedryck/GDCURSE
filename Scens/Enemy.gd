extends Area2D


func _on_Enemy_body_entered(body: Node) -> void:
	get_tree().call_group("Rules", "hurt")
	pass # Replace with function body.
