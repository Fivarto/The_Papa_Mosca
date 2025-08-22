extends Node


var player_score: int
var player_life : int = 3



func game_over():
	
	var player_name = "Froggo"
	var final_score = GameManager.player_score
	
	Leaderboard.add_score(player_name, final_score)
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")


func set_player_life(value: int) -> void:
	
	player_life = clamp(value, 1 , 3)


func reset_player_stats():
	
	player_score = 0
	player_life = 3
