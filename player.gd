extends CharacterBody2D

@export var speed: float = 500.0
@export var gravity: float = 1000.0
@export var jump_force: float = 500.0

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	velocity.x = direction.x * speed

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0.0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	move_and_slide()
