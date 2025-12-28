extends Node2D
class_name Pipe

@onready var area: Area2D = %Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.body_entered.connect(playerEntered)
	pass  # Replace with function body.


func playerEntered(body: Node2D):
	if body.has_method("die"):
		body.die()
