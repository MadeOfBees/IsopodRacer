extends Node

var level=0
var cur_level=0
var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.
	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func _process(_delta):
	if level != cur_level:
		match level:
			0: 
				goto_scene("res://main.tscn")
			1: 
				goto_scene("res://gameB.tscn")
			2: 
				goto_scene("res://gameJ.tscn")
			3: 
				goto_scene("res://level0.tscn")
			4: 
				goto_scene("res://level1.tscn")
			5: 
				goto_scene("res://level2.tscn")
			6: 
				goto_scene("res://level3.tscn")
			999:
				goto_scene("res://win.tscn")
			var l: 
				print("Level "+str(l)+ " is not valid")
		cur_level=level

func next_level():
	level+=1
	
func set_level(l):
	level=l

func get_level():
	return level
