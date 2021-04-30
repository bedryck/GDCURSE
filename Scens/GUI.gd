extends CanvasLayer

func update_lifes():
	print("Иконки обновленні")

func add_lives(lives_count):
	while lives_count > $Control/HeartContainer.get_child_count():
		$Control/HeartContainer.add_child(load("res://Scens/hurt.tscn").instance())
		
func remove_lives(lives_count):
	var count = $Control/HeartContainer.get_child_count()
	if(lives_count < count):
		$Control/HeartContainer.get_child(count -1).queue_free()

func set_coins(coins_number):
		$Control/CoinsContainer/Label.text = str(coins_number);
