extends CharacterBody2D

@export var speed: float = 50.0
@export var patrol_distance: float = 35.0

var direction = 1
var start_x: float

func _ready():
	start_x = global_position.x

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if global_position.x >= start_x + patrol_distance:
		direction = -1
	elif global_position.x <= start_x - patrol_distance:
		direction = 1

	velocity.x = speed * direction

	move_and_slide()
