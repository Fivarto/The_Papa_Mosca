extends Node2D
class_name Mosca_Spawner

@export var mosca_to_spawn: Array[PackedScene] = []


@export var spawn_interval: float = 1.5
@export var max_moscas: int = 5
@export var spawn_area: Rect2 = Rect2(Vector2.ZERO , Vector2(320, 10))


var current_mosca: int = 0
var _timer: Timer


func _ready() -> void:
	
	_timer = Timer.new()
	_timer.wait_time = spawn_interval
	_timer.one_shot = false
	_timer.autostart = true
	
	add_child(_timer)
	
	_timer.timeout.connect(spawn_mosca) 



func spawn_mosca():
	
	if current_mosca >= max_moscas:
		return
	
	if mosca_to_spawn.size() == 0:
		return
	
	
	var mosca_scene: PackedScene = mosca_to_spawn[randi() %mosca_to_spawn.size()]
	var mosca_ins = mosca_scene.instantiate()
	
	var pos = Vector2(
		
		randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
		randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
	)
	
	mosca_ins.position = pos
	
	get_parent().add_child(mosca_ins)
	current_mosca += 1
	
	if mosca_ins.has_signal("tree_exited"):
		mosca_ins.tree_exited.connect(_on_mosca_removed)


func _on_mosca_removed():
	current_mosca = max(current_mosca - 1, 0)
