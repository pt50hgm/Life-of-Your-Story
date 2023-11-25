extends Node2D

onready var textList = get_children()
export var startTimer : float
var textIndex = 0
var timer = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = startTimer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if textIndex < textList.size():
		timer -= delta
		if timer < 0:
			textList[textIndex].fade_in()
			timer += textList[textIndex].readTime
			textIndex += 1
			
