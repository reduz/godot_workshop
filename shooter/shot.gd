
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

const SPEED = -400

func _process(delta):
	translate( Vector2(0,SPEED*delta) )

func _ready():
	# Initialization here
	set_process(true)
	pass

func _on_visibility_exit_screen():
	queue_free()
	pass # replace with function body


func _on_shoot_area_enter( area ):
	if (area.has_method("can_destroy") and area.can_destroy()):
		area.destroy()
		queue_free()
		
	pass # replace with function body
