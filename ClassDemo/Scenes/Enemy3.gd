extends KinematicBody2D

var velocity = Vector2()
export var speed = 50
const GRAVITY := 35
export var direction = 1

#Adding the export boolean so we can easily make our enemy fall or not fall
export var can_fall = false

func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h()
		$ground_check.position.x = $ground_checker.position.x *-1
	
	#If we want the enemy to be able to fall
	if can_fall:
		#then it should be disabled.
		$ground_check.enabled = false

func _process(delta):
	#print ($ground_check.position.x)
	if is_on_wall():
		flip_enemy()
	
	#if can_fall is unchecked
	if not can_fall:
		#check to see if the groundchecker is colliding
		#if we don't put is_on_floor() as a second condition
		#Then the enemy will switch direction every frame until it hits the floor.
		if not $ground_check.is_colliding() and is_on_floor():
			#if it's not colliding, we'll know we hit an edge and turn around.
			flip_enemy()
		
		
	velocity.y += GRAVITY
	velocity.x += speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
func flip_enemy():
	direction = direction * -1
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	#flip the raycast
	$ground_check.position.x = $ground_check.position.x *-1
