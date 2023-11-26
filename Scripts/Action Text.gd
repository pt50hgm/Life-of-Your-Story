extends Node2D

export var readTime : int
export var nextScene : String
export var action : int

var released = false
var fadeIn = false
var fadeDuration = 0.5
var isHovering = false
var colourVal = 0

onready var sceneManager = get_node("/root/Main/SceneManager")
onready var text = $Text
onready var area2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0
	
	var textSize = text.rect_size
	area2d.get_node("CollisionShape2D").shape.extents = textSize/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Input.is_mouse_button_pressed(1):
		released = true
	else:
		released = false
	
	if fadeIn:
		modulate.a += (1.1 - modulate.a)/fadeDuration * delta
	else:
		modulate.a += (-0.1 - modulate.a)/fadeDuration * delta
	
	if fadeIn:
		if isHovering:
			colourVal += (1 - colourVal)/0.3 * delta
		else:
			colourVal += (0 - colourVal)/0.3 * delta
		text.set("custom_colors/font_color", Color(1, 1-colourVal, 1-colourVal))

func _input(event):
	if fadeIn:
		if isHovering and Input.is_mouse_button_pressed(BUTTON_LEFT) and released:
			get_parent().canWalk = false
			
			if action == 0:
				sceneManager.start_next_scene(nextScene)



func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false


func _on_GameArea2D_area_entered(area):
	fadeIn = true

func _on_GameArea2D_area_exited(area):
	fadeIn = false
