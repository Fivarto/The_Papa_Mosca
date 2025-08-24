extends Area2D
class_name Mosca


@export var mosca_res: Mosca_Resource

@onready var mosca_sprite: Sprite2D = $Mosca_Sprite
@onready var collision_shape_2d: CollisionShape2D = $HitBox/CollisionShape2D

var consumed_already: bool = false

func _ready() -> void:
	
	mosca_sprite.texture = mosca_res.mosca_texture


func _physics_process(delta: float) -> void:
	
	position.y += mosca_res.mosca_move_speed * delta


func eaten():
	
	if consumed_already:
		return
	
	consumed_already = true
	SignalBus.food_consumed.emit(mosca_res.mosca_points)
	GameManager.player_score += mosca_res.mosca_points
	
	
	queue_free()


func do_damge_to_player(damage_amount: int):
	
	if GameManager.player_lifes > 0:
		GameManager.player_lifes = clamp(GameManager.player_lifes - damage_amount, 0, 3)
		
	if GameManager.player_lifes == 0:
		GameManager.game_over()


func _on_hit_box_area_entered(area: Area2D) -> void:
	
	
	if area.is_in_group("Player"):
		print("COMIDO")
		eaten()
	
	pass


func _on_out_screen_hit_box_area_entered(area: Area2D) -> void:
	
	print("ENTROU NA KILLZONE")
	if area.is_in_group("KillZone"):
		do_damge_to_player(1)
		SignalBus.update_life_display.emit()
		self.call_deferred("queue_free")
