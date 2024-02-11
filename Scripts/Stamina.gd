extends StaticBody2D

@onready var _animated_sprite = $AnimatedSprite2D

var tot_frames = 13

func _ready():
	_animated_sprite.pause()
	
func handlestamina(stamina):
	print("Stamina "+ stamina)
	
func _on_shrimpball_stamina(val):
	if val > 0:
		_animated_sprite.set_frame(floor(val / 7))
	elif val >= 91:
		_animated_sprite.set_frame( 13 )
	else:
		_animated_sprite.set_frame( 0 )
