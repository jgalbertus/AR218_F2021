extends KinematicBody2D

#container to store movement direction
var velocity = Vector2()

#variable for how fast this one goes
export var speed = 50

#right now the gravity is the same as the player.  Do you want that?
const GRAVITY := 35

#facing left (-1) or right (1) on the x axis?
export var direction = 1

func _ready():
	#at the start of the game, if the sprite is facing  left,  flip the sprite
	if direction == -1:
		$AnimatedSprite.flip_h()

func _process(delta):
	
	#Add gravity
	velocity.y += GRAVITY
	
	#Add movement
	velocity.x += speed * direction
	
	#Apply that velocity
	velocity = move_and_slide(velocity, Vector2.UP)
