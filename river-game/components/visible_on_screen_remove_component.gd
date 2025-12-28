class_name VisibleOnScreenRemoveComponent
extends VisibleOnScreenNotifier2D

@export var actor: Node2D


func _on_screen_exited() -> void:
	print("delte")
	actor.queue_free()
