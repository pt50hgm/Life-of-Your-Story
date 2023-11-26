extends "res://Scripts/Text.gd"

export var readTime : int
export var thisFadeDuration : float
export var nextScene : String

var released = false
var isHovering = false
var colourVal = 0

onready var text = $Text
onready var area2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	fadeDuration = thisFadeDuration
	
	var textSize = text.rect_size
	area2d.get_node("CollisionShape2D").shape.extents = textSize/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Input.is_mouse_button_pressed(1):
		released = true
	else:
		released = false
		
	if fadeIn or isReady:
		if isHovering:
			colourVal += (1 - colourVal)/0.3 * delta
		else:
			colourVal += (0 - colourVal)/0.3 * delta
		text.set("custom_colors/font_color", Color(1, 1-colourVal, 1-colourVal))

func _input(event):
	if fadeIn or isReady:
		if isHovering and Input.is_mouse_button_pressed(BUTTON_LEFT) and released:
			sceneManager.start_next_scene(nextScene)

func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false
