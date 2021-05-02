extends KinematicBody2D

var linner_velocity: Vector2 = Vector2.ZERO
const SPEED = 800;
const JUMP_SPEED = 2400
var facing = "right"

onready var sprite = $Sprite;

func _physics_process(_delta: float) -> void:
	apply_gravity()
	jump()
	move()
	move_and_slide(linner_velocity, Globals.UP)
	animate()
	attac()
	
func apply_gravity():
	if(position.y > Globals.LEVEL_BORDER):
		get_tree().call_group("Rules", "game_over")
	if(is_on_floor() and linner_velocity.y > 0):
		linner_velocity.y = 0;
	if is_on_ceiling():
		linner_velocity.y = 1
	else:
		linner_velocity.y += Globals.GRAVITY*9.8;
		pass

func jump():
	if Input.is_action_pressed('jump') && is_on_floor():
		$Jump.play()
		linner_velocity.y = -JUMP_SPEED
		
func move():

	if Input.is_action_pressed("left") && !Input.is_action_pressed("right"):
		linner_velocity.x = -SPEED
		facing = "left"
	elif Input.is_action_pressed("right") && !Input.is_action_pressed("left"):
		linner_velocity.x = SPEED
		facing = "right"
	else: linner_velocity.x = 0
	
func animate():
	if(linner_velocity.y < 0):
		return sprite.play('jump')
	if(linner_velocity.x > 0):
		sprite.flip_h = false;
		return sprite.play('walk')
	if(linner_velocity.x < 0):
		sprite.flip_h = true;
		return sprite.play('walk')
	return	sprite.play('idle')
	
	
func hurt():
	$Hurt.play()
	linner_velocity.y = -JUMP_SPEED*0.9
		
func boost():
	linner_velocity.y = -JUMP_SPEED*1.5
	
func attac():
	if (Input.is_action_just_pressed("attac") && Globals.COINS > 0):
		var projectile = load("res://Scens/CoinProjectile.tscn").instance()
		if(facing == "left"):
			projectile.direction = -1
		else:
			projectile.direction = 1
		add_child(projectile)
		projectile.set_as_toplevel(true)
		
	pass
