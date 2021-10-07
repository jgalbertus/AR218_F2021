extends Area2D

#This is our own custom signal.  We could name it anything.
signal coin_collected

func _on_Collectable_body_entered(body):
	Global.score = Global.score + 1
	#this will emit the signal when it's collected
	emit_signal("coin_collected")
	
	#the $ remember means get_node, and works only if the that node is a child
	#AnimationPlaer is a child of the node this script is on, so it works.
	#play is a built in method.  We're passing the name of the animation into it.
	$AnimationPlayer.play("Bounce")
	

	#you could also write this as:
	#Global.score += 1
	
	#turns off all collisions once it's been entered
	set_collision_layer_bit(3, false)
	set_collision_mask_bit(0, false)
	
	
func _on_AnimationPlayer_animation_finished(anim_name):
	#notice that this function has an argument "anim_name"
	#this signal will pass the name of the animation that finished into that variable
	#below we're testing that variable to see if it is the Bounce animaiton.
	#We don't want the sprite to delete when the "FakeRotate" animation ends, do we?
	#the == sign means "is the same as"
	#So, if the variable anim_name is the same as the String "Bounce"
	#Then we delete it!
	if anim_name == "Bounce":
		#remember, queue_free() deletes this object from our game!
		queue_free()
	


