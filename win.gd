extends Node


var mouse = load("res://Assets/mouse_sm.png")
# Called when the node enters the scene tree for the first time.
func _ready():
		Input.set_custom_mouse_cursor(mouse)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_restart_pressed():
	Game.set_level(0)
	
func _on_quit_pressed():
	Game.quit()
