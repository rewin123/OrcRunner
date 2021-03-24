extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var epos = Vector2()
var escale = Vector2()

var e_key_inst = preload("res://props/E_key.tscn")
var e_key = null
# Called when the node enters the scene tree for the first time.
func _ready():
	epos = $Sprite2.position
	escale = $Sprite2.scale
	$Sprite2.queue_free()
	pass # Replace with function body.



func _process(delta):
	pass
	

func UseMe(player):
	player.ChangeHunger(10)
	queue_free()


func _on_Mushroom_area_entered(area):
	e_key = e_key_inst.instance()
	add_child(e_key)
	e_key.position = epos
	e_key.scale = escale
	pass


func _on_Mushroom_area_exited(area):
	if e_key != null:
		e_key.queue_free()
		e_key = null
	pass
