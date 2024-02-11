extends Node

var level=0
var cur_level=0

func _process(_delta):
	if level != cur_level:
		match level:
			0: 
				get_tree().change_scene_to_file("res://main.tscn")
			1: 
				get_tree().change_scene_to_file("res://gameJ.tscn")
			2: 
				get_tree().change_scene_to_file("res://gameB.tscn")
		cur_level=level
	

func _on_start_j_button_up():
	level = 1

func _on_start_b_button_up():
	level = 2
