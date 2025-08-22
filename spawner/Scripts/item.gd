extends Area2D
class_name ItemBase

@export var item_res: item_resource

var consumed_already: bool = false

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	
	sprite_2d.texture = item_res.item_texture



func _physics_process(delta: float) -> void:
	
	position.y += item_res.item_move_speed * delta




func eaten():
	
	if consumed_already:
		return
	
	consumed_already = true
	SignalBus.food_consumed.emit(item_res.item_points)
	GameManager.player_score += item_res.item_points
	print(GameManager.player_score)
	
	queue_free()


func _do_damage(damage_amount : int):
	if GameManager.player_life > 0:
		GameManager.player_life = clamp(GameManager.player_life - damage_amount, 0 , 3)
		print(GameManager.player_life)
	if GameManager.player_life == 0:
		GameManager.game_over()

func _on_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("Player"):
		print("Bateu no player")
		eaten()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	
	print("Saiu da tela, DANO")
	
	_do_damage(1)
