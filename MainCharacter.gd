extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

const GRAVITY = 400.0
const WALK_SPEED = 100
const RUN_SPEED = 200
const jump = -200
const stop = 10
const acc = 50
const maxhanger = 100

onready var ip = get_node("AnimatedSprite")

var vec = Vector2()
var walk = 0
var sword = "shte"

var full_hunger_time = 10.0 * 60.0
var hunger_decreasing = 100.0 / full_hunger_time

var full_heal_time = 10.0 * 60.0
var healing_speed = 100.0 / full_heal_time

var objects_in_range = []

func _ready():
	$hunger.value = 100.0
	$health.value = 50.0
	$water.value = 50.0
	$stamina.value = 100.0
	
func hunger_heal(delta):
	if $hunger.value > 50:
		$health.value += delta * ($hunger.value - 50.0) / 50.0 * healing_speed

func _physics_process(delta):
	vec.y += delta * GRAVITY
	
	if Input.is_action_pressed("Use"):
		for i in range(len(objects_in_range)):
			if(objects_in_range[i].has_method("UseMe")):
				objects_in_range[i].UseMe(self)
				break
				
	
	if Input.is_action_pressed("shift"):
		walk = 1
	else:
		walk = 0
	
	if walk == 0:
		if Input.is_action_pressed("A") and vec.x > -WALK_SPEED:
			vec.x -= acc
			ip.flip_h = true
			$AnimatedSprite.play("run")
		if Input.is_action_pressed("D") and vec.x < WALK_SPEED:
			vec.x += acc
			ip.flip_h = false
			$AnimatedSprite.play("run")
	else:
		if Input.is_action_pressed("A") and vec.x > -RUN_SPEED:
			vec.x -= acc
			ip.flip_h = true
			$AnimatedSprite.play("run")
		if Input.is_action_pressed("D") and vec.x < RUN_SPEED:
			vec.x += acc
			ip.flip_h = false
			$AnimatedSprite.play("run")
	if is_on_floor():
		if vec.x > -10 and vec.x < 10:
			vec.x = 0
			if sword == "shte":
				$AnimatedSprite.play("stay")
			else:
				$AnimatedSprite.play("stay_sword")
		elif vec.x > 0:
			vec.x -= stop
		elif vec.x < 0:
			vec.x += stop
	
	if Input.is_action_pressed("space") and is_on_floor():
		vec.y = jump
		$AnimatedSprite.play("jump")
	if vec.y > 10 and not is_on_floor():
		$AnimatedSprite.play("fall")
		
		
	if Input.is_action_just_pressed("attack") and sword == "shte":
		sword = "drw"
		$AnimatedSprite.play("sword_drw")
	if Input.is_action_just_pressed("shte") and sword == "drw":
		sword = "shte"
		$AnimatedSprite.play("sword_shte")
	
	hunger_heal(delta)
	$hunger.value -= delta*hunger_decreasing
		
	move_and_slide(vec, Vector2(0, -1))

func ChangeHunger(d_hunger):
	$hunger.value += d_hunger

func _on_Area2D_area_entered(area):
	objects_in_range.append(area)
	print("Area in player ", area.get_name())


func _on_Area2D_area_exited(area):
	for i in range(len(objects_in_range)):
		if objects_in_range[i] == area:
			print("Area out player ", area.get_name())
			objects_in_range.remove(i)
			break
