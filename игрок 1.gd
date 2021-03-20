extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 0
var y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		x += 5
	if Input.is_action_pressed("ui_left"):
		x -= 5
	move_local_x(x)
	x = 0

