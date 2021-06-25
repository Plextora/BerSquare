extends Sprite

# The variable "brrrr" is the shooting speed

# The variable "oof" is damage

# the "woah_chill_mate" timer is the powerup cooldown


var speed = 250

var default_speed = speed

var oof = 1

var default_oof = oof

var brrrr = 0.04

var default_brrrr = brrrr

var power_up_reset = []

var velocity = Vector2()

var bullet = preload("res://Scenes/Bullet.tscn")

var can_shoot = true

var is_ded = false

func _ready():
	Global.player = self

func _exit_tree():
	Global.player = null

func _process(delta):
	velocity.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = velocity.normalized()
	
	global_position.x = clamp(global_position.x, 24, 616 )
	
	global_position.y = clamp(global_position.y, 24, 336)
	
	if is_ded == false:
		global_position += speed * velocity * delta
	if Input.is_action_pressed("shoot") and Global.node_creation_parent != null and can_shoot and is_ded == false:
		AudioManager.play("res://Sounds/shoot (spray and pray mode).wav")
		var bullet_instance = Global.instance_node(bullet, global_position, Global.node_creation_parent)
		bullet_instance.damage = oof
		$Reload_Speed.start()
		can_shoot = false

func _on_Reload_Speed_timeout():
	can_shoot = true
	$Reload_Speed.wait_time = brrrr


func _on_HitBox_area_entered(area):
	if area.is_in_group("Enemy"):
		Global.spray_and_pray_character = false
		is_ded = true
		visible = false
		yield(get_tree().create_timer(2.5), "timeout")
		Global.spray_and_pray_character = true
		Global.game_over_score = Global.score
		get_tree().change_scene("res://Scenes/game_over.tscn")

func _on_woah_chill_mate_timeout():
	if power_up_reset.find("Power_up_reload") != null:
		brrrr = default_brrrr
		power_up_reset.erase("Power_up_reload")
	if power_up_reset.find("Power_up_speed") != null:
		speed = default_speed
		power_up_reset.erase("Power_up_speed")
