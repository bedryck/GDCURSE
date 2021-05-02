extends KinematicBody2D

var velocity = Vector2.ZERO
const THROW_VELOCITY = Vector2(800, -500)
var direction = 1;

func _ready():
	launch()
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += Globals.GRAVITY * 2
	var collision = move_and_collide(velocity * delta)
	if(collision != null) || position.y > Globals.LEVEL_BORDER:
		queue_free()
	pass

func launch():
	velocity = THROW_VELOCITY * Vector2(direction, 1)
