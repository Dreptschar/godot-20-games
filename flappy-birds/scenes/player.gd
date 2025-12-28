extends RigidBody2D

@export var sprite: AnimatedSprite2D

var flap_qued := false


func die():
	print("YOU DED")
	get_tree().reload_current_scene()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		flap_qued = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play()


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	#clamp vertical speed
	var v = state.linear_velocity
	v.y = clampf(v.y, -500, 900)
	state.linear_velocity = v

	if flap_qued:
		flap_qued = false
		if state.linear_velocity.y > 0.0:
			state.linear_velocity.y = 0.0
		state.apply_central_impulse(Vector2(0.0, -650))
	var target_rot := clampf(state.linear_velocity.y * 0.0018, deg_to_rad(-25.0), deg_to_rad(25.0))
	state.transform = Transform2D(target_rot, state.transform.origin)
