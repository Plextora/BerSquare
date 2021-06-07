extends Node2D


func _process(_delta):
	if Input.is_action_pressed("MainMenu"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_Button_pressed():
	if Global.hell_character == true:
		get_tree().change_scene("res://Scenes/Hell.tscn")
	if Global.normal_character == true:
		get_tree().change_scene("res://Scenes/World.tscn")
	if Global.spray_and_pray_character == true:
		get_tree().change_scene("res://Scenes/Spray_and_pray.tscn")

func _on_quit_pressed():
	get_tree().quit()
