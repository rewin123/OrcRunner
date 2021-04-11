extends "res://Generator/Room.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fill_room(tilemap, random_seed):
	var rnd = OpenSimplexNoise.new()
	rnd.set("seed", random_seed)
	
	for y in range(y0, y1):
		for x in range(x0, x1):
			var fill = rnd.get_noise_2d(x, y)
			if fill >= 0:
				tilemap.set_cell(x, y, 0, false, false, false, Vector2(5,0))
