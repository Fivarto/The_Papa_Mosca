extends Node2D
class_name ItemSpawner

@export var items_to_spawn: Array[PackedScene] = []


@export var spawn_interval: float = 2.0
@export var max_items: int = 5
@export var spawn_area: Rect2 = Rect2(Vector2.ZERO, Vector2(170, 10))


var _current_item: int = 0
var _timer: Timer


func _ready() -> void:
	
	_timer = Timer.new()
	_timer.wait_time = spawn_interval
	_timer.one_shot = false
	_timer.autostart = true
	
	add_child(_timer)
	
	_timer.timeout.connect(spawn_item)
	



func spawn_item():
	
	if _current_item >= max_items:
		return
	
	if items_to_spawn.size() == 0:
		return
	
	
	var item_scene: PackedScene = items_to_spawn[randi() %items_to_spawn.size()]
	var item_instance = item_scene.instantiate()
	
	var pos = Vector2(
		randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
		randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
	)
	
	item_instance.position = pos
	
	get_parent().add_child(item_instance)
	_current_item += 1
	
	if item_instance.has_signal("tree_exited"):
		item_instance.tree_exited.connect(_on_item_removed)
	
	pass


func _on_item_removed():
	
	_current_item = max(_current_item - 1, 0)
	
	
	
	
