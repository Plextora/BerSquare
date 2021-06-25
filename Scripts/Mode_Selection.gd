extends Node2D

func _process(_delta):
	if Input.is_action_pressed("MainMenu"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_Mode_Selection_tree_entered():
	Global.hell_character = false
	Global.normal_character = false
	Global.spray_and_pray_character = false
