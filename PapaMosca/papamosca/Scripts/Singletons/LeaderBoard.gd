extends Node


var scores: Array = []

const SAVE_PATH := "user://leaderboard.save"
const MAX_ENTRIES := 5


func _ready() -> void:
	
	load_scores()


func add_score(player_name: String, player_score: int):
	
	scores.append({"name" : player_name, "score" : player_score})
	scores.sort_custom(func(a, b): return a["score"] > b["score"])
	
	if scores.size() > MAX_ENTRIES:
		scores.resize(MAX_ENTRIES)
	
	save_score()
	

func save_score():
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(scores)
	file.close()

func load_scores():
	
	#CHECA SE O ARQUIVO EXISTE , PEGA AS INFORMAÇÕES E ADICIONA NA VAR FILE, PEGA AS INFORMAÇÕES E COLOCA NOS SCORES, DEPOIS FECHA O ARQUIVO
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH , FileAccess.READ)
		scores = file.get_var()
		file.close()
	
