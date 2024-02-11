extends Node

func _on_start_j_pressed():
	Game.set_level(2)
	
func _on_start_b_pressed():
	Game.set_level(1)

func _on_start_pressed():
	Game.set_level(3)

func _on_quit_pressed():
	Game.quit()
