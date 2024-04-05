extends Area2D

@onready var game_size: Vector2 = get_viewport().get_visible_rect().size
@onready var sprite: Sprite2D = $Sprite as Sprite2D

var speed: float

const OFFSET_X = 250
const OFFSET_Y = 30


func _ready():
	var rnd_scale: float = randf_range(5, 8)
	scale = Vector2(rnd_scale, rnd_scale)

	speed = randf_range(5, 10)
	
	position = Vector2(
		randf_range(OFFSET_X, game_size.y + OFFSET_X),
		game_size.y + sprite.texture.get_height() + OFFSET_Y
	)


func _physics_process(_delta):
	position.y -= speed
	
	if position.y < -(sprite.texture.get_height() + OFFSET_Y):
		queue_free()


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/States/GameOver.tscn")
