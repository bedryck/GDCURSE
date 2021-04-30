extends Node2D
var LIFES = 3;
var COINS = 0;


func _ready() -> void:
	get_tree().call_group("GUI", "add_lives", LIFES)

func hurt():
	get_tree().call_group("GUI", "remove_lives", LIFES - 1)
	$Player.hurt()
	LIFES -= 1
	if(LIFES < 1):
		game_over()
	
func game_over():
	get_tree().change_scene("res://Scens/GameOver.tscn")
	pass
	
func add_coin():
	COINS += 1;
	get_tree().call_group("GUI", "set_coins", COINS)
	pass

func remove_coin():
	COINS -= 1;
	get_tree().call_group("GUI", "set_coins", COINS)
	pass
