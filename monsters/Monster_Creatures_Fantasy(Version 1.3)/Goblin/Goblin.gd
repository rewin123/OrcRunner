extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var vel = Vector2(0, 0)

const GRAVITY = Constants.GRAVITY

onready var enemy_target = find_node("player", true, false)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	vel.y += GRAVITY * delta
	if is_on_floor():
		vel.y = 0
		
	var target_x = 0
	if enemy_target != null:
		target_x = sign(enemy_target.position.x - position.x) * 50.0
		$RayCast2D.cast_to = enemy_target.position - position
	else:
		target_x = 0
		
	vel.x += (target_x - vel.x) * delta * 10
	
	move_and_slide(vel, Vector2(0, -1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Question_animation_finished():
	$Question.playing = false
	$Question.frame = 0
	$Question.visible = false
	pass # Replace with function body.




func _on_VisionArea_area_entered(area):
	if area.get_parent().name == "player":
		enemy_target = area.get_parent()


func _on_VisionArea_area_exited(area):
	if enemy_target == area.get_parent():
		enemy_target = null
