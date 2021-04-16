extends KinematicBody2D

var linner_velocity: Vector2 = Vector2.ZERO
const SPEED = 800;
const GRAVITY = 24
const JUMP_SPEED = 2400
const UP = Vector2(0,-1)

func _physics_process(_delta: float) -> void:
	apply_gravity()
	jump()
	move()
	move_and_slide(linner_velocity, UP)
	
	
func apply_gravity():
	if(is_on_floor()):
		linner_velocity.y = 0;
	else:
		linner_velocity.y += GRAVITY*9.8;
		pass

func jump():
	if Input.is_action_just_pressed('jump') && is_on_floor():
		linner_velocity.y = -JUMP_SPEED
		
func move():
	if Input.is_action_pressed("left") && !Input.is_action_pressed("right"):
		linner_velocity.x = -SPEED
	elif Input.is_action_pressed("right") && !Input.is_action_pressed("left"):
		linner_velocity.x = SPEED
	else: linner_velocity.x = 0
	
