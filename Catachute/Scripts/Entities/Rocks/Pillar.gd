extends Area2D


@onready var game_size: Vector2 = get_viewport().get_visible_rect().size
@onready var sprite: Sprite2D = $Sprite as Sprite2D

var speed: float

const SPAWN_OFFSET: float = 30


func _ready():
	speed = randf_range(5, 10)
	
	var rnd_scale: int = randi_range(5, 10)
	scale = Vector2(rnd_scale, rnd_scale)
	
	# Set the Y pos to below the screen!
	position.y = game_size.y + sprite.texture.get_height() + SPAWN_OFFSET
	
	# Pick a random side and offset
	var width: float = sprite.texture.get_width()
	var offset: int = randi_range(0, 20)
	
	position.x = game_size.x - (width * 2)
	if randi_range(0, 1) == 1:
		position.x = (width * 2) - offset
		sprite.flip_h = true

		return

	position.x += offset


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	position.y -= speed
	
	if position.y < -(sprite.texture.get_height() + SPAWN_OFFSET):
		queue_free()


func _on_body_entered(_body):
	get_tree().change_scene_to_file("res://Scenes/States/GameOver.tscn")
