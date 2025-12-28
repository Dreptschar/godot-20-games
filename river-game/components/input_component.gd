extends Node

@export var move_component: MoveComponent
@export var spawn_component: SpawnerComponent


func _ready() -> void:
	if move_component == null:
		push_error("no move_component")


func _input(event: InputEvent) -> void:
	if event.is_action("ui_left") || event.is_action("ui_right"):
		var direction = Input.get_axis("ui_left", "ui_right")
		move_component.velocity = Vector2(direction, 0.0)
	elif event.is_action_pressed("ui_select"):
		spawn_component.spawn()
