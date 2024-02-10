extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	max_value=100
	min_value=0
	value=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shrimpball_stamina(val):
	value=val
