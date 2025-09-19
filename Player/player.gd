extends CharacterBody2D

@export var speed: float = 400.0
@export var gravity: float = 980.0
@export var jump_force: float = 600.0
@export_range(0,1) var decelaration = 0.1
@export_range(0,1) var accelaration = 0.1
@export_range(0,1) var decelarate_on_jump = 0.1

var player_name = ""
var hp = 100
var mp = 50
var cp = 5
var ip = 1

func _physics_process(delta: float) -> void:

	var direction = Input.get_axis('move_left',"move_right")
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * accelaration)
	else:
		velocity.x = move_toward(velocity.x, 0, speed * decelaration)

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0.0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	if Input.is_action_just_released('jump') and velocity.y < 0:
		velocity.y *= decelarate_on_jump


	move_and_slide()
