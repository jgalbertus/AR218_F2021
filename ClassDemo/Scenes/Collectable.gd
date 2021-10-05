extends Area2D



func _on_Collectable_area_entered(area):
	queue_free()
	print ("entered")
	pass # Replace with function body.


func _on_Collectable_body_entered(body):
	queue_free()
	print ("b_entered")
	pass # Replace with function body.
