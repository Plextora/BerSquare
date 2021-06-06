extends Label

func _ready():
	text = str(Global.highscore)

func _process(delta):
	if Global.score > Global.highscore:
		Global.highscore = Global.score
