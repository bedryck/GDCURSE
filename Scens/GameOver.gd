extends Control


func _on_Restart_pressed() -> void:
	get_tree().change_scene("res://Scens/Level1.tscn")
	pass # Replace with function body.


func _on_Exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
