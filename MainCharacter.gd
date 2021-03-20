extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

const GRAVITY = 400.0
const WALK_SPEED = 100
const RUN_SPEED = 200
const jump = -100
const stop = 10
const acc = 50

onready var ip = get_node("AnimatedSprite")

var vec = Vector2()
var walk = 0

func _physics_process(delta):
	vec.y += delta * GRAVITY
	if Input.is_action_pressed("shift"):
		walk = 1
	else:
		walk = 0
	
	
	if walk == 0:
		if Input.is_action_pressed("A") and vec.x > -WALK_SPEED:
			vec.x -= acc
			ip.flip_h = true
		if Input.is_action_pressed("D") and vec.x < WALK_SPEED:
			vec.x += acc
			ip.flip_h = false
	else:
		if Input.is_action_pressed("A") and vec.x > -RUN_SPEED:
			vec.x -= acc
			ip.flip_h = true
		if Input.is_action_pressed("D") and vec.x < RUN_SPEED:
			vec.x += acc
			ip.flip_h = false
	
	
	
	
	if vec.x > -10 and vec.x < 10:
		vec.x = 0
	elif vec.x > 0:
		vec.x -= stop
	elif vec.x < 0:
		vec.x += stop
	
	if Input.is_action_pressed("space") and vec.y > 1:
		vec.y = jump

	move_and_slide(vec, Vector2(0, -1))

