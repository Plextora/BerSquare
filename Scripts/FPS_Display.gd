extends MarginContainer

func _physics_process(delta):
	$HBoxContainer/VBoxContainer/Stats.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
