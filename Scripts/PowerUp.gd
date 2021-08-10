# the "woah_chill_mate" timer is the powerup cooldown
extends Sprite

export(String) var player_variable_modify

export(float) var player_variable_set

export(float) var cooldown = 2.5

func _on_HitBox_area_entered(area):
	if area.is_in_group("Player"):
		AudioManager.play("res://Sounds/powerup.wav")
		area.get_parent().set(player_variable_modify, player_variable_set)
		area.get_parent().get_node("woah_chill_mate").wait_time = 3.76
		area.get_parent().get_node("woah_chill_mate").start()
		area.get_parent().power_up_reset.append("Power_up_reload")
		queue_free()
	if area.is_in_group("Enemy"):
		queue_free()
