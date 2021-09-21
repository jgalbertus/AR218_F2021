extends KinematicBody2D

var velocity := Vector2(0,0)
const SPEED := 180
const GRAVITY := 1.5
const JUMP := -90

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	#show with "pressed"
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += JUMP
	
	#velocity.y = 30
	
	velocity.y += GRAVITY
	
	#ctrl click brings up documentation.  Look at what move and slide returns
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#else velocity.x = 0
	velocity.x = lerp(velocity.x, 0,0.1)
	#print (velocity)
	#print (is_on_floor())
