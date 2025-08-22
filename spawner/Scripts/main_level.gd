extends Node2D

@onready var label: Label = $UI/Label

func _ready() -> void:
	
	SignalBus.food_consumed.connect(_on_food_consumed)
	label.text = ""

func _on_food_consumed(points : int):
	
	label.text = str(int(label.text) + points)
