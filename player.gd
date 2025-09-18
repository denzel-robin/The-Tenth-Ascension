extends CharacterBody2D

@export var speed: float = 400.0
@export var gravity: float = 980.0
@export var jump_force: float = 400.0
@export_range(0,1) var decelaration = 0.1
@export_range(0,1) var accelaration = 0.1
#@export_range(0,1) var decelarate_on_jump = 0.1
@export var dash_max_distance = 300.0
@export var dash_speed = 1000.0
@export var dash_cooldown = 1.0
@export var dash_curve: Curve

var is_dashing = false
var dash_start_pos = 0
var dash_dir = 0
var dash_timer = 0

var hp = 100
var mp = 50

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
	#if Input.is_action_just_released('jump') and velocity.y < 0:
		#velocity.y *= decelarate_on_jump

	if Input.is_action_just_pressed('dash') and not is_dashing and dash_timer <= 0:
		is_dashing = true
		dash_timer = dash_cooldown
		dash_dir = direction
		dash_start_pos = position.x
	if is_dashing:
		var current_dist = abs(position.x - dash_start_pos)
		if current_dist > dash_max_distance or is_on_wall():
			is_dashing = false
		else:
			velocity.x = dash_dir * dash_speed * dash_curve.sample(current_dist / dash_max_distance)
			velocity.y = 0
	if dash_timer > 0:
		dash_timer -= delta


	move_and_slide()
