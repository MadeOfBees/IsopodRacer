extends RigidBody2D

var attraction_strength = 100.0  # Adjust the attraction strength as needed

func _ready():
	set_physics_process(true)

func _integrate_forces(state: PhysicsDirectBodyState2D):
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = (mouse_position - state.transform.origin).normalized()
	var force = direction_to_mouse * attraction_strength
	if Input.is_action_pressed("game_magnet"):
		state.apply_central_impulse(force)
	else:
		var zero_force = Vector2(0,0)
		state.set_constant_force(zero_force)



func _input(event):
	print(event.as_text())
