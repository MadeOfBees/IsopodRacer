extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_j_pressed():
	Game.set_level(2)
	
func _on_start_b_pressed():
	Game.set_level(1)

func _on_start_pressed():
	Game.set_level(3)
