
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
var destroyed=false
func can_destroy():
	return not destroyed
func destroy():
	if (not destroyed):
		get_node("anim").play("explode")
		destroyed=true
func _ready():
	# Initialization here
	pass


