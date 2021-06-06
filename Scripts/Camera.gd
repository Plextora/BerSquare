extends Camera2D

var shake_start = false

var shake_intensity = 0


func _ready():
	Global.camera = self

func _exit_tree():
	Global.camera = null

func _process(delta):
	zoom = lerp(zoom, Vector2(1, 1), 0.3)
	
	if shake_start == true:
		global_position += Vector2(rand_range(-shake_intensity, shake_intensity), rand_range(-shake_intensity, shake_intensity)) * delta

func screen_shake(intensity, time):
	zoom = Vector2(1, 1) - Vector2(intensity * 0.01, intensity * 0.02)
	shake_intensity = intensity
	$shake_time.wait_time = time
	$shake_time.start()
	shake_start = true

func _on_shake_time_timeout():
	shake_start = false
