extends Button



func _on_Play_Button_pressed():
	get_tree().change_scene("res://Scenes/Mode_Selection.tscn")
	
	if get_tree().change_scene("res://Scenes/Mode_Selection.tscn") != OK:
		print("An unexpected error occured when trying to switch to the Mode_Selection scene")
