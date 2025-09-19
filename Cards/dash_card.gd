#extends Node2D
#
#@export var dash_max_distance = 300.0
#@export var dash_speed = 1000.0
#@export var dash_cooldown = 1.0
#@export var dash_curve: Curve
#
#var is_dashing = false
#var dash_start_pos = 0
#var dash_dir = 0
#var dash_timer = 0
#
#func _physics_process(delta: float) -> void:
	#if Input.is_action_just_pressed('dash') and not is_dashing and dash_timer <= 0:
		#is_dashing = true
		#dash_timer = dash_cooldown
		#dash_dir = direction
		#dash_start_pos = position.x
	#if is_dashing:
		#var current_dist = abs(position.x - dash_start_pos)
		#if current_dist > dash_max_distance or is_on_wall():
			#is_dashing = false
		#else:
			#velocity.x = dash_dir * dash_speed * dash_curve.sample(current_dist / dash_max_distance)
			#velocity.y = 0
	#if dash_timer > 0:
		#dash_timer -= delta
