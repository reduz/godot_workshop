
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

const SPEED=200

var prev_shoot=false

func _process(delta):

	var motion = Vector2()
	
	if (Input.is_action_pressed("up")):
		motion+=Vector2(0,-1)
	if (Input.is_action_pressed("down")):
		motion+=Vector2(0,1)
	if (Input.is_action_pressed("left")):
		motion+=Vector2(-1,0)
	if (Input.is_action_pressed("right")):
		motion+=Vector2(1,0)

	var shoot = Input.is_action_pressed("shoot")

	var pos = get_pos()
	pos+=motion*SPEED*delta
	
	var screen_size = get_viewport().get_rect().size
	
	pos.x = clamp(pos.x,0,screen_size.x)
	pos.y = clamp(pos.y,0,screen_size.y)
	
	set_pos( pos )
	
	if (shoot and not prev_shoot):
		var shot = preload("res://shot.scn").instance()
		var at = get_node("gun").get_global_pos()
		shot.set_global_pos(at)
		get_parent().add_child(shot)
		pass
	
	prev_shoot=shoot
	

func _ready():
	# Initialization here
	set_process(true)
	pass


