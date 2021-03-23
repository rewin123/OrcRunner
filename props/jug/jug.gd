extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func UseMe(player):
	player.ChangeWater(10)
	queue_free()

func _on_Jug_area_entered(area):
	$E_key.visible = true


func _on_Jug_area_exited(area):
	$E_key.visible = false
