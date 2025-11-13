extends Node

var current_score = 0
var player_name = "AAA"

var high_scores = []

var SAVE_PATH = "res://highscores"

func _ready():
	load_scores()

func add_score(new_score):
	high_scores.append({"name": player_name, "score": new_score})

	high_scores.sort_custom(func(a, b): return a.score > b.score)
	
	if high_scores.size() > 10:
		high_scores.pop_back()
		
	save_scores()
	
func save_scores():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(high_scores)


func load_scores():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_scores = file.get_var()
	else:
		high_scores = []
