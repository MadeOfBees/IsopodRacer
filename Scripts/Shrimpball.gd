extends RigidBody2D

var attraction_strength = 50.0  # Adjust the attraction strength as needed
var max_stam = 100
var stamina_val = 80
var stamina_inc_step = 50
var stamina_dec_step = 4


# Load the custom images for the mouse cursor.
var mouse = load("res://Assets/mouse_sm.png")
var magnet = load("res://Assets/mouse_magnet_sm.png")

signal stamina(val)

func _process(delta):
	if stamina_val < max_stam:
		stamina_val += delta*stamina_inc_step	
	stamina.emit(stamina_val)
	sleeping = false

func _ready():
	Input.set_custom_mouse_cursor(mouse)
	set_physics_process(true)

func _integrate_forces(state: PhysicsDirectBodyState2D):
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = (mouse_position - state.transform.origin).normalized()
	var force = direction_to_mouse * attraction_strength
	if Input.is_action_pressed("game_magnet") and stamina_val > 0:
		stamina_val -= stamina_dec_step
		if stamina_val > 1: 
			state.apply_central_impulse(force)
			Input.set_custom_mouse_cursor(magnet)
	else:
		var zero_force = Vector2(0,0)
		state.set_constant_force(zero_force)
		Input.set_custom_mouse_cursor(mouse)
