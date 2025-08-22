extends Control


@onready var leader_board_list: VBoxContainer = $LeaderBoardList
const PIXEL_FONT = preload("res://Assets/Fonts/pixel.ttf")

func _ready() -> void:
	
	update_board()


func update_board():
	
	for child in leader_board_list.get_children():
		child.queue_free()
	
	for entry in Leaderboard.scores:
		var lbl = Label.new()
		lbl.text = "%s : %d" % [entry["name"], entry["score"]]
		lbl.add_theme_font_override("font" , PIXEL_FONT)
		lbl.add_theme_font_size_override("font_size", 10)
		leader_board_list.add_child(lbl)
		


func _on_back_to_menu_button_pressed() -> void:
	
	
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
