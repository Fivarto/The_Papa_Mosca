extends Control


func _on_start_button_pressed() -> void:
	
	GameManager.reset_player_stats()
	get_tree().change_scene_to_file("res://Scenes/Levels/main_level.tscn")

func _on_button_placar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/leader_board_ui.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
