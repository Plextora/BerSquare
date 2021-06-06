extends Button


func _on_Normal_Button_pressed():
	Global.is_ded = false
	get_tree().change_scene("res://Scenes/World.tscn")
