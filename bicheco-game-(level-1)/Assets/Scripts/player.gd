
extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const MAX_JUMPS = 2

var jumps_used = 0

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Reset jumps when touching the ground.
	if is_on_floor():
		jumps_used = 0

	# Handle jumping and double jumping.
	if Input.is_action_just_pressed("ui_accept") and jumps_used < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		jumps_used += 1

		# Restart jump animation for each jump.
		animated_sprite.play("Jump")

	# Handle horizontal movement.
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Flip character depending on direction.
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Handle animations.
	if not is_on_floor():
		if animated_sprite.animation != "Jump":
			animated_sprite.play("Jump")
	elif direction != 0:
		if animated_sprite.animation != "Run":
			animated_sprite.play("Run")
	else:
		if animated_sprite.animation != "Idle":
			animated_sprite.play("Idle")

	move_and_slide()
