class_name MoveComponent
extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var move_stats: MoveStatsResource


func _ready() -> void:
	if actor == null || move_stats == null:
		push_error("missing dependency")


func _physics_process(delta: float) -> void:
	if actor is CharacterBody2D:
		actor.velocity = velocity * move_stats.speed
		actor.move_and_slide()
	else:
		actor.position += velocity * move_stats.speed * delta
