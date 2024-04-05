extends CharacterBody2D

@export var SPEED: int
@export var MAX_ACCELL: int
@export var AIR_FRICTION: int

@onready var sprite = $Sprite

var current_beans = 0

func _ready():
	sprite.get_node("AnimationPlayer").play("Sway")


func _physics_process(_delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x , direction * MAX_ACCELL, SPEED)

		# Because of the guard;
		# This won't reset flip when letting go.
		sprite.flip_h = direction == -1
	else:
		velocity.x = move_toward(velocity.x, 0, AIR_FRICTION)

	move_and_slide()
