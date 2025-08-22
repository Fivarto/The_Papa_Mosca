extends Node2D
class_name Frog

var dragging: bool = false
var drag_offset: Vector2 = Vector2(0 , 0)
@onready var mouth: Area2D = $Mouth


@onready var sprite_2d: AnimatedSprite2D = $Sprite2D


func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if _mouse_over():
					mouth.monitorable = true
					dragging = true
					drag_offset = global_position - get_global_mouse_position()
					sprite_2d.play("Open_Mouth")
				else:
					mouth.monitorable = false
					dragging = false
					sprite_2d.play("Idle")
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		print("Stop dragging")
		dragging = false
		sprite_2d.play("Idle")


func _process(delta: float) -> void:
	
	if dragging:
		global_position.x = get_global_mouse_position().x + drag_offset.x


func _mouse_over() -> bool:
	
	var mouse_pos = get_global_mouse_position()
	var shape = $CollisionShape2D.shape
	
	if shape is RectangleShape2D:
		var rect = Rect2(global_position - shape.extents, shape.extents * 2)
		return rect.has_point(mouse_pos)
	return false





func _on_mouth_area_entered(area: Area2D) -> void:
	
	sprite_2d.play("Munching")
	await get_tree().create_timer(.3).timeout
	sprite_2d.play("Open_Mouth")
