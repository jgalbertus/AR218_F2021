extends KinematicBody2D

var velocity = Vector2(0,0)

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = 100
	elif Input.is_action_pressed("left"):
		velocity.x = -100
	else: velocity.x = 0
	
	move_and_slide(velocity)
	
