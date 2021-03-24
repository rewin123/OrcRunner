extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0
	pass # Replace with function body.

func _process(delta):
	modulate.a += delta * (1.0 - modulate.a) * 2.0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
