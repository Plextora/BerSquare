extends Sprite

var velocity = Vector2(1, 0)
var speed = 450
var damage

var look_once = true

func _process(delta):
	if Global.spray_and_pray_character == true:
		modulate = Color("e2b846")
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta


func _on_Visibility_Check_screen_exited():
	queue_free()
