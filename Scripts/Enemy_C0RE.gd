extends Sprite

# Some clarification for weird names of groups, variables, etc.

# uhhhh i forgot what the fuck "oh_god_why" is sorry ¯\_(ツ)_/¯

# the "basic_evilness_kek" function is just basic enemy movement

# the "ouch" group is bullets

# the "oof_ouch_that_hurts_alot_mate" is the timer that changes the color of enemies when hit with a bullet

# And that's it! (I think lmfao)

# shakey jakey is that cool effect you get when you kill an enemy

# the "ya_yeet" variable is knockback

# -Plextora (The dev of this hetic open source game)

export(int) var speed = 110

export(int) var hp = 3

export(int) var ya_yeet = 525

export(int) var shakey_jakey = 20

onready var current_color = modulate 

var velocity = Vector2()

var ow_god_why = false

var blood_particles = preload("res://Scenes/Blood_Particles.tscn")

func _process(_delta):
	if hp <= 0:
		AudioManager.play("res://Sounds/explosion.wav")
		if Global.camera != null:
			Global.camera.screen_shake(shakey_jakey, 0.1)
		Global.score += 10
		if Global.node_creation_parent != null:
			var blood_particles_instance = Global.instance_node(blood_particles, global_position, Global.node_creation_parent)
			blood_particles_instance.rotation = velocity.angle()
		queue_free()

func basic_evilness_kek(delta):
	if Global.player != null and ow_god_why == false:
		velocity = global_position.direction_to(Global.player.global_position)
		global_position += velocity * speed * delta
	
	elif ow_god_why:
		velocity = lerp(velocity, Vector2(0, 0), 0.50)
		global_position += velocity * delta

func _on_HitBox_area_entered(area):
	if area.is_in_group("ouch") and ow_god_why == false:
		modulate = Color.white
		velocity = -velocity * ya_yeet
		hp -= area.get_parent().damage
		ow_god_why = true
		$oof_ouch_that_hurts_alot_mate.start()
		area.get_parent().queue_free()

func _on_oof_ouch_that_hurts_alot_mate_timeout():
	modulate = current_color
	ow_god_why = false
