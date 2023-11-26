extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var blurMode : int

onready var blurFilter = get_child(0)
var blurVal = 0
var blurBool = false
var blur = false
var blurStart = false
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	if not blurStart:
		if blurMode == 1:
			if time > 1:
				blurVal = 5
				blur = true
				blurStart = true
		elif blurMode == 3:
			blurVal = 1.5
			blur = true
			blurStart = true
	
	if blur:
		if blurMode == 1:
			blurVal -= 0.02
			if blurVal <= 0:
				blurVal = 0
				blur = false
		elif blurMode == 2:
			if not blurBool:
				blurVal += 0.05
				if blurVal >= 5:
					blurVal = 5
					blurBool = true
					get_parent().change_to_image()
			else:
				blurVal -= 0.05
				if blurVal <= 0:
					blurVal = 0
					blur = false
					get_parent().get_parent().increment()
		
		blurFilter.material.set_shader_param("amount", blurVal)

func start_blur():
	if not blurStart:
		if blurMode == 2:
			blurVal = 0
			blur = true
			blurStart = true
