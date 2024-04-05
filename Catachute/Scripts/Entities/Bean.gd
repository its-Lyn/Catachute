extends Area2D


signal score_changed(new_score: int)


@export var speed_debuff: int;

var rot: float 
var speed: float

const OFFSET = 60

# Handled by the BeanManager
var player: Node2D


func _ready():
	rot = randf_range(5.0, 15.0)

	var size: float = randf_range(1.0, 1.5)
	$Sprite.scale = Vector2(size, size)

	# Calculate speed based on rotation
	speed = rot - speed_debuff


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
