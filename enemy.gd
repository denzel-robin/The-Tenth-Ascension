extends CharacterBody2D

var hp = 100

func _physics_process(delta: float) -> void:
	print('Enemy HP: ',hp)
