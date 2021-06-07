extends Node2D

export(Array, PackedScene) var enemies

export(Array, PackedScene) var powerups

func _ready():
	Global.node_creation_parent = self
	Global.score = 0
	Global.kills = 0

func _process(_delta):
	if Input.is_action_pressed("MainMenu"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
		
		if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
			print("An unexpected error occured when trying to switch to the MainMenu scene")

func _exit_tree():
	Global.node_creation_parent = null

func _on_Spawn_Timer_timeout():
	var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	var enemy_number = round(rand_range(0, enemies.size() -1))
	
	Global.instance_node(enemies[enemy_number], enemy_position, self)

func _on_Difficulty_timeout():
	if $Spawn_Timer.wait_time > 0.85:
		$Spawn_Timer.wait_time -= 0.037

func _on_Power_Up_Spawn_Timer_timeout():
	var power_up_number = round(rand_range(0, powerups.size() -1))
	
	Global.instance_node(powerups[power_up_number], Vector2(rand_range(0, 640), rand_range(0, 360)), self)


func _on_Spray_and_pray_tree_entered():
	Global.spray_and_pray_character = true

func _on_World_tree_entered():
	Global.normal_character = true

func _on_Hell_tree_entered():
	Global.hell_character = true
