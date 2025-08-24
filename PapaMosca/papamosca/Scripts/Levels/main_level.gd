extends Node2D

@onready var label: Label = $CanvasLayer/Player_HUD/Label
@onready var life_display_sprite: AnimatedSprite2D = $CanvasLayer/Life_Display_Sprite


func _ready() -> void:
	
	
	SignalBus.food_consumed.connect(_on_food_consumed)
	SignalBus.update_life_display.connect(_on_life_display_update)
	label.text = "00"


func _on_food_consumed(points: int):
	
	label.text = str(int(label.text) + points)


func _on_life_display_update():
	
	match GameManager.player_lifes:
		3:
			life_display_sprite.frame = 3
		2:
			life_display_sprite.frame = 2
		1:
			life_display_sprite.frame = 1
