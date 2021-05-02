extends Node2D



func _ready() -> void:
	get_tree().call_group("GUI", "add_lives", Globals.LIFES)

func hurt():
	get_tree().call_group("GUI", "remove_lives", Globals.LIFES - 1)
	$Player.hurt()
	Globals.LIFES -= 1
	if(Globals.LIFES < 1):
		game_over()
	
func game_over():
	get_tree().change_scene("res://Scens/GameOver.tscn")
	pass
	
func add_coin():
	Globals.COINS += 1;
	get_tree().call_group("GUI", "set_coins", Globals.COINS)
	pass

func remove_coin():
	Globals.COINS -= 1;
	get_tree().call_group("GUI", "set_coins", Globals.COINS)
	pass
