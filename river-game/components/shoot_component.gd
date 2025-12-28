extends Node
class_name ShootComponent

@export var gunPositions: Array[Marker2D] = []
@export var bullet: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


func shoot():
	for gun in gunPositions:
		var bulletInstance = bullet.instantiate()
		gun.add_child(bulletInstance)
