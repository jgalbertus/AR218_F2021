extends Label

#note that I've put a space after the first quotation so the space is 
#part of my string
var my_string = " JOY COLLECTED"

func _on_Collectable_coin_collected():
	#The "String()" method allows us to turn our integer into a string.
	#Remember we can't do math on strings, they're for us to read, so 
	#Adding the score up wouldn't work.  But we need it to be a string for
	#the text box to show it.
	text = str(Global.score) + my_string
	print (Global.score)
