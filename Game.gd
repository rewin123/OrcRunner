extends Node2D

onready var noise = OpenSimplexNoise.new()



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tilemap = get_node("TileMap")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	noise.set("seed", rand_range(0, 10000000))
	noise.octaves = 4
	noise.period = 40.0
	noise.persistence = 0.8
	for y in range(0, 100):
		for x in range(0, 100):
			var val = noise.get_noise_2d(x, y)
			if val > 0:
				tilemap.set_cell(x, y, 0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
