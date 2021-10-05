extends Area2D



func _on_Collectable_area_entered(area):
	queue_free()
	print ("entered")
	pass # Replace with function body.
