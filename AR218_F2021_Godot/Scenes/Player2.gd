extends KinematicBody2D

var velocity := Vector2(0,0)
const SPEED := 180
const GRAVITY := 35
const JUMP := -900

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
	#show with "pressed"
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += JUMP
		
	if not is_on_floor():
		$AnimatedSprite.play("air")
	
	#velocity.y = 30
	
	velocity.y += GRAVITY
	print(velocity)
	#ctrl click brings up documentation.  Look at what move and slide returns.  The up is necessary for is on floor.
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#else velocity.x = 0
	velocity.x = lerp(velocity.x, 0,0.1)
	#print (velocity)
	#print (is_on_floor())
