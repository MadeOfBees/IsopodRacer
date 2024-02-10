extends RigidBody2D

func _ready():
	# Make sure the physics process is enabled to check for input in physics frames
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		teleport_to_mouse_cursor()

func teleport_to_mouse_cursor():
	var mouse_position = get_global_mouse_position()
	position = mouse_position
	linear_velocity = Vector2.ZERO  # Optional: Reset velocity to avoid unintended movement after teleporting
