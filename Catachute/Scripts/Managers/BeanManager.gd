extends Node


@onready var bean_scene: PackedScene = preload("res://Scenes/Entities/Bean.tscn")
@onready var game_size: Vector2 = get_viewport().get_visible_rect().size

@export var player_scene: Node2D
@export var game: Node

const OFFSET = 100


func _on_spawner_timeout():
	var bean = bean_scene.instantiate()
	bean.player = player_scene
	bean.score_changed.connect(game.score_changed)

	# Calculate random X position~
	bean.position = Vector2(
		randf_range(OFFSET, game_size.x - OFFSET),
		game_size.y + OFFSET
	)

	add_child(bean)
