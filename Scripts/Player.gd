extends KinematicBody2D

var linner_velocity: Vector2 = Vector2.ZERO
const SPEED = 800;
const GRAVITY = 24
const JUMP_SPEED = 2400
const UP = Vector2(0,-1)
const LEVEL_BORDER = 3000; 

onready var sprite = $Sprite;

func _physics_process(_delta: float) -> void:
	apply_gravity()
	jump()
	move()
	move_and_slide(linner_velocity, UP)
	animate()
	
func apply_gravity():
	if(position.y > LEVEL_BORDER):
		get_tree().call_group("Rules", "game_over")
	if(is_on_floor() and linner_velocity.y > 0):
		linner_velocity.y = 0;
	if is_on_ceiling():
		linner_velocity.y = 1
	else:
		linner_velocity.y += GRAVITY*9.8;
		pass

func jump():
	if Input.is_action_pressed('jump') && is_on_floor():
		$Jump.play()
		linner_velocity.y = -JUMP_SPEED
		
func move():

	if Input.is_action_pressed("left") && !Input.is_action_pressed("right"):
		linner_velocity.x = -SPEED
	elif Input.is_action_pressed("right") && !Input.is_action_pressed("left"):
		linner_velocity.x = SPEED
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
