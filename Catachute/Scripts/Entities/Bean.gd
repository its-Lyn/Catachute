extends Area2D
# TODO speed
# ,,, spread

signal score_changed(new_score: int)


@export var speed_debuff: int;

var rot: float 
var speed: float

const OFFSET = 60

const MIN_ROT: float = 5.0
const MAX_ROT: float = 15.0

const MIN_SPEED: float = 5.0
const MAX_SPEED: float = 8.0

# Handled by the BeanManager
var player: Node2D


func _ready():
	var rand: float = randf_range(0, 1)
	
	rot = (MAX_ROT - MIN_ROT) * rand + MIN_ROT
	speed = (MAX_SPEED - MIN_SPEED) * rand + MIN_SPEED

	var size: float = randf_range(1.0, 1.5)
	$Sprite.scale = Vector2(size, size)


func _physics_process(_delta):
	rotation_degrees += rot
	position.y -= speed

	if position.y <= -OFFSET:
		queue_free()


func _on_body_entered(body):
	if body == player:
		player.current_beans += 1
		score_changed.emit(player.current_beans)

		queue_free()
