extends Node


@export var bean_label: Label


func score_changed(new_score):
	bean_label.text = "Beans: %s" % new_score
