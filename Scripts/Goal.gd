extends Area2D

@onready var _animated_sprite = $AnimatedSprite2D

func _ready():
	_animated_sprite.play("default")
	
func _on_body_entered(body):
	if body.name == "Shrimpball":
		get_tree().change_scene_to_file("res://main.tscn")
