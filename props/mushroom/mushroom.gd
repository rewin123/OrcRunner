extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	pass


func _on_Mushroom_area_entered(area):
	$Sprite2.Visible = true
	pass


func _on_Mushroom_area_exited(area):
	$Sprite2.Visible = false
	pass
