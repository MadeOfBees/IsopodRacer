extends Node

func _on_start_j_button_up():
	get_tree().change_scene_to_file("res://gameJ.tscn")

func _on_start_b_button_up():
	get_tree().change_scene_to_file("res://gameB.tscn")
