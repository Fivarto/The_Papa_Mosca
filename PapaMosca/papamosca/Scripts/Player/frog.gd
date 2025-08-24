extends CharacterBody2D
class_name Frog


var is_dragging : bool = false


@onready var mouth: Area2D = $Mouth
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D


func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_dragging = true
				mouth.monitorable = true
				sprite_2d.play("open_mouth")
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				is_dragging = false
				mouth.monitorable = false
				sprite_2d.play("closed_mouth")
				

func _physics_process(delta: float) -> void:
	
	if is_dragging == true:
		#position.x = get_global_mouse_position().x
		var tween_position = get_tree().create_tween()
		tween_position.tween_property(self , "position:x", get_global_mouse_position().x, 0.5 )
