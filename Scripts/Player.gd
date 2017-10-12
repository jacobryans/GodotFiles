extends KinematicBody2D

export var MOTION_SPEED = 140
#RayNode var created to represent the RayCast node
var RayNode

func _ready():
	#Calls _fixed_process function
	set_fixed_process(true)
	#RayNode is set to the Raycast Node
	RayNode = get_node("RayCast2D")

func _fixed_process(delta):
	#Sets our vector(2 values x or y position. Determines an object's position in a scene.)
	var motion = Vector2()
	#Movement
	if (Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)
		RayNode.set_rotd(180)
		
	if (Input.is_action_pressed("ui_down")):
		motion += Vector2(0, 1)
		RayNode.set_rotd(0)
		
	if (Input.is_action_pressed("ui_left")):
		motion += Vector2(-1, 0)
		RayNode.set_rotd(-90)
		
	if (Input.is_action_pressed("ui_right")):
		motion += Vector2(1, 0)
		RayNode.set_rotd(90)
		
	motion = motion.normalized()*MOTION_SPEED*delta
	move(motion)