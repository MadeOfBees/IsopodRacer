extends Node

@onready var game = get_node("/root/Game")

func _on_goal_body_entered(body):
	if (body.name == "Shrimpball"):
		game.next_level()
