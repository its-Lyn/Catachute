extends CharacterBody2D

@export var SPEED: int
@export var MAX_ACCELL: int
@export var AIR_FRICTION: int

func _physics_process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x , direction * MAX_ACCELL, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, AIR_FRICTION)

	move_and_slide()
