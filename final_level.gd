extends Node

@onready var game = get_node("/root/Game")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_goal_body_entered(body):
	if (body.name == "Shrimpball"):
		game.win()
