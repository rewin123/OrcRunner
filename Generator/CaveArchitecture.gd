extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var levels = []
var levels_y = []

onready var tilemap = get_node("TileMap")
onready var room_inst = preload("res://Generator/Room.gd")


var blocks_in_meter = 4

var level_count = 5
var room_count = 5
var world_width = blocks_in_meter * room_count * 40


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_levels()
	generate_rooms()
	pass # Replace with function body.

func generate_levels():
	randomize()
	
	var y0 = 0
	for i in range(level_count):
		var h = int(rand_range(10 * blocks_in_meter, 20 * blocks_in_meter))
		levels_y.append([y0, y0 + h])
		levels.append([])
		y0 += h
		print('Level ', levels_y[i][0], ' ', levels_y[i][1])
		
func generate_rooms():
	for y in range(level_count):
		var proportions = []
		var sum = 0
		for x in range(room_count):
			proportions.append(rand_range(0.5, 1))
			sum += proportions[x]
			
		var x0 = 0
		for x in range(room_count):
			proportions[x] /= sum
			var room = room_inst.new()
			room.y0 = levels_y[y][0]
			room.y1 = levels_y[y][1]
			room.x0 = x0
			var x1 = int(x0 + proportions[x] * world_width)
			room.x1 = x1
			x0 = x1
			room.fill_room(tilemap)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
