extends KinematicBody2D

var velocity = Vector2()
export var speed = 50
const GRAVITY := 35
export var direction = 1

export var can_fall = false

func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h()
		$ground_check.position.x = $ground_checker.position.x *-1
	
	if can_fall:
		$ground_check.enabled = false

func _process(delta):

	if is_on_wall():
		flip_enemy()

	if not can_fall:
		if not $ground_check.is_colliding() and is_on_floor():
			flip_enemy()

	velocity.y += GRAVITY
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func flip_enemy():
	direction = direction * -1
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	#flip the raycast
	$ground_check.position.x = $ground_check.position.x *-1



func _on_player_checker_body_entered(body):
	if body.name == "Player":
		body.energy = body.energy - 1
		print(body.energy)
		if body.energy <= 0:
			get_tree().change_scene("res://Scenes/Level1.tscn")
		
		#find the fade timer node, and start it.
		$Fade_Timer.start()
		#stop the animation
		$AnimatedSprite.playing = false
		#deselect collision layer.  Check that the bit matches your list!
		#Note that you have turn off both the KinematicBody that 
		#this script is attached to and the Area2D node.
		set_collision_layer_bit(5, false)
		$player_checker.set_collision_layer_bit(5, false)
		#also, turn off the collision player bit mask
		#set_collision_mask_bit(0, false)
			
func _on_Fade_Timer_timeout():
	#When the timer runs out, remove this node from the game
	queue_free()
