extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $VBoxContainer/StartButton/AnimatedSprite2D
@onready var button_sprite_leaderboard: AnimatedSprite2D = $VBoxContainer/LeaderboardButton/ButtonSprite_Leaderboard
@onready var button_sprite_exit: AnimatedSprite2D = $VBoxContainer/Exit/ButtonSprite_Exit


@onready var start_label: Label = $VBoxContainer/StartButton/Label
@onready var label_leaderboard: Label = $VBoxContainer/LeaderboardButton/Label
@onready var exit_label: Label = $VBoxContainer/Exit/Label

func _on_start_button_pressed() -> void:
	
	GameManager.reset_player_status()
	get_tree().change_scene_to_file("res://Scenes/Levels/main_level.tscn")


func _on_leaderboard_button_pressed() -> void:
	
	
	get_tree().change_scene_to_file("res://Scenes/Menus/leader_board_ui.tscn")


func _on_exit_pressed() -> void:
	
	
	get_tree().quit()



#GAMBIARRA
#START BUTTN
func _on_start_button_mouse_entered() -> void:
	
	animated_sprite_2d.frame = 1
	start_label.position.y += 2


func _on_start_button_mouse_exited() -> void:
	
	animated_sprite_2d.frame = 0
	start_label.position.y -= 2


#LEADERBOARD BUTTON
func _on_leaderboard_button_mouse_entered() -> void:
	
	button_sprite_leaderboard.frame = 1
	label_leaderboard.position.y += 2


func _on_leaderboard_button_mouse_exited() -> void:
	
	button_sprite_leaderboard.frame = 0
	label_leaderboard.position.y -= 2


#EXIT BUTTON
func _on_exit_mouse_entered() -> void:
	
	button_sprite_exit.frame = 1
	exit_label.position.y += 2


func _on_exit_mouse_exited() -> void:
	
	button_sprite_exit.frame = 0
	exit_label.position.y -= 2
