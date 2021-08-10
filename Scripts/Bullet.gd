extends Sprite

var velocity = Vector2(1, 0)
var speed = 450
var damage

var look_once = true

func _process(delta):
	if Global.spray_and_pray_character == true:
		modulate = Color("e2b846")
	if Global.normal_character == true:
		modulate = Color("3b80ea")
	if Global.hell_character == true:
		modulate = Color("be2e52")
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta

func _on_Visibility_Check_screen_exited():
	queue_free()

func _on_HitBox_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
	if area.is_in_group("Wall"):
		queue_free()
