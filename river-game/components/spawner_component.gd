class_name SpawnerComponent
extends Node

@export var spawningScene: PackedScene
@export var spawner: Array[Marker2D]


func spawn():
	if spawner.size() == 0:
		push_error("SpawnerComponent has no children to spawn from")
	for marker in spawner:
		var spanedObject = spawningScene.instantiate() as Node2D
		print("spawned bullet")
		marker.add_child(spanedObject)
