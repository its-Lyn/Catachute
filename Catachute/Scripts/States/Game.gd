extends Node


@export var bean_label: Label
@export var metre_label: Label


func score_changed(new_score: int):
	bean_label.text = "Beans: %d" % new_score


func _on_player_metre_travelled(metres: int):
	metre_label.text = "Distance: %dm" % metres
