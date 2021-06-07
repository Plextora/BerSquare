extends Button


func _on_Spray_and_pray_Button_pressed():
	Global.is_ded = false
	get_tree().change_scene("res://Scenes/Spray_and_pray.tscn")
	
	if get_tree().change_scene("res://Scenes/Spray_and_pray.tscn") != OK:
		print("An unexpected error occured when trying to switch to the MainMenu scene")
