extends Node

var player_score: int = 0
var player_lifes: int = 3




func game_over():
	
	var player_name = "Froggo"
	var final_score = player_score
	
	LeaderBoard.add_score(player_name , final_score)
	call_deferred("_go_to_menu")
	

func reset_player_status():
	
	player_score = 0
	player_lifes = 3


func _go_to_menu():
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
