class_name PositionClampComponent
extends Node

@export var actor: Node2D
@export var margin: float = 8

var borderLeft = 0
var borderRight = ProjectSettings.get_setting("display/window/size/viewport_width")


func _ready() -> void:
	if !actor:
		push_error("missing dependecy")


func _process(delta: float) -> void:
	actor.global_position.x = clampf(
		actor.global_position.x, borderLeft + margin, borderRight - margin
	)
