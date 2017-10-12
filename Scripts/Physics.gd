extends Node

onready var movement = Movement.new()

class Movement:

	var KEYS = [ "ui_up", "ui_down", "ui_left", "ui_right" ]
	const Keys = {
		"ui_up" : { "x" : 0, "y" : -1, "rotation" : 180 },
		"ui_down" : { "x" : 0, "y" : 1, "rotation" : 0 },
		"ui_left" : { "x" : -1, "y" : 0, "rotation" : -90 },
		"ui_right" : { "x" : 1, "y" : 0, "rotation" : 90 }
	}
	
	func tryMove():
		if checkMove():
			return doMove()
		else:
			return null
	
	func checkMove():
		for index in KEYS:
			if(Input.is_action_pressed(index)):
				return true
		return false
	
	func doMove():
		for index in KEYS:
			var key = Keys[index]
			if Input.is_action_pressed(index):
				return key