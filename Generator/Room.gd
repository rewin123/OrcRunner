extends Node


var x0 = 0
var x1 = 0
var y0 = 0
var y1 = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func fill_room(tilemap):
	for x in range(x0, x1):
		tilemap.set_cell(x, y0, 0)
		tilemap.set_cell(x, y1, 0)
	for y in range(y0, y1):
		tilemap.set_cell(x0, y, 0)
		tilemap.set_cell(x1, y, 0)
