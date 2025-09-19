extends CharacterBody2D

@export var speed: float = 100.0
@export_range(0,1) var decelaration = 0.1
@export_range(0,1) var accelaration = 0.1

var enemy_id = 00001
var enemy_name = ""
var enemy_type = ""
var hp = 100
var mp = 50
var cp = 5
var ip = 1

func _physics_process(delta: float) -> void:

	var direction
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * accelaration)
	else:
		velocity.x = move_toward(velocity.x, 0, speed * decelaration)


	move_and_slide()
