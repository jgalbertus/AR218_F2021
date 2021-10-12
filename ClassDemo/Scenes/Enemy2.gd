extends KinematicBody2D

var velocity = Vector2()

export var speed = 50

const GRAVITY := 35

export var direction = 1

func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h()

func _process(delta):
	#if enemy hits a wall....
	if is_on_wall():
		#then change direction
		direction = direction * -1
		#and flip the sprite
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		
	velocity.y += GRAVITY
	

	velocity.x += speed * direction
	

	velocity = move_and_slide(velocity, Vector2.UP)
