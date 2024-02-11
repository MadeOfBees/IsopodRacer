extends Node

@onready var game = get_node("/root/Game")

func _process(_delta):
	if Input.is_action_pressed("exit"):
		game.quit()
	if Input.is_action_pressed("restart"):
		game.restart_level()

func _on_goal_body_entered(body):
	if (body.name == "Shrimpball"):
		game.next_level()
