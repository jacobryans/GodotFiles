extends KinematicBody2D

export var MOTION_SPEED = 140

var raynode

onready var physics = preload("Physics.gd")
onready var movement = physics.Movement.new()

func _ready():
	set_fixed_process(true)
	raynode = get_node("RayCast2D")

func _fixed_process(delta):
	processMove(delta)

func processMove(delta):
	var motion = Vector2()
	var key = movement.tryMove()
	
	if key != null:
		motion += Vector2(key["x"], key["y"])
		raynode.set_rotd(key["rotation"])
		motion = motion.normalized() * MOTION_SPEED * delta
		move(motion)