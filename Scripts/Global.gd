extends Node

var node_creation_parent = null

var player = null

var graphics = true

var hell_character = false

var kills = 0

var kills_game_over = 0

var is_ded = false

var spray_and_pray_character = false

var normal_character = false

var game_over_score = 0

var game_over_text = false

var camera = null

var highscore = 0

var score = 0

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
