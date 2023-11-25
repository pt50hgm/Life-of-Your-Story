extends "res://Scripts/Text.gd"

export var readTime : int
export var thisFadeDuration : float
export var nextScene : String

var isHovering = false
var colourVal = 0

onready var image = $Image
onready var area2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	fadeDuration = thisFadeDuration


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fadeIn or isReady:
		if isHovering:
			colourVal += (1 - colourVal)/0.3 * delta
		else:
			colourVal += (0 - colourVal)/0.3 * delta
		image.modulate = Color(1, 1-colourVal, 1-colourVal)

func _input(event):
	if fadeIn or isReady:
		if isHovering and Input.is_mouse_button_pressed(BUTTON_LEFT):
			sceneManager.start_next_scene(nextScene)

func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false
