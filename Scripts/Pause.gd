extends CanvasLayer

func _ready():
	set_visible(false)

func _input(event):
	if event.is_action_pressed("pause"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused

func _on_Continue_pressed():
	get_tree().paused = false
	set_visible(false)

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Back_to_main_menu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
