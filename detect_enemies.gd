extends Area2D

#func _process(delta: float) -> void:
	
	
func _on_body_entered(body):
	if body.name == 'Player':
		print(body)
	#return true

func _on_body_exited(body: Node2D):
	if body.name == 'Player':
		print(body)
