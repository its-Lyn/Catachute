extends Node


@onready var pillar_scene: PackedScene = preload("res://Scenes/Entities/Rocks/Pillar.tscn")
@onready var floater_scene: PackedScene = preload("res://Scenes/Entities/Rocks/Floater.tscn")


func _on_pillar_spawner_timeout():
	add_child(pillar_scene.instantiate())


func _on_floater_spawner_timeout():
	add_child(floater_scene.instantiate())
