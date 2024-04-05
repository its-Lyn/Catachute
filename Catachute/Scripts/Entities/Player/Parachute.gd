extends Area2D

const MAX_ANGLE: int = 30
const OFFSET_ANGLE: int = 4
const THRESHOLD: float = 5

var speed: float = 2
var return_speed: float = 2

var offset: int = randi_range(OFFSET_ANGLE, -OFFSET_ANGLE)

@export var sprite: Sprite2D


func _physics_process(_delta):
	# Once we've reached the max angle 
	# We make the speed slower
	# This makes the 'shaking' look nicer
	if (
		abs(rotation_degrees) >= (MAX_ANGLE - abs(offset)) and 
		abs(rotation_degrees) <= (MAX_ANGLE + abs(offset))
	):
		speed = 0.2
	else:
		speed = 2

	var direction = Input.get_axis("left", "right")
	if direction:
		# We use minus MAX_ANGLE because the parachute goes against player movement.
		# Because... That's how wind works.
		var goal = direction * -MAX_ANGLE
		var to_rot = goal + offset

		rotation_degrees = move_toward(rotation_degrees, to_rot, speed)
	else:
		speed = 2
		rotation_degrees = move_toward(rotation_degrees, 0, return_speed)


func _on_offset_switch_timeout():
	offset = randi_range(OFFSET_ANGLE, -OFFSET_ANGLE)
