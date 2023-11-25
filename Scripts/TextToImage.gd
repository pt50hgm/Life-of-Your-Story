extends Node2D

export var imagePath : String
export var colour : Color

var isHovering = false
var colourVal = 0
var change = false

onready var textToImageManager = get_parent()
onready var text = $Text
onready var area2d = $Area2D
onready var blurManager = $BlurManager
onready var image = $Image

# Called when the node enters the scene tree for the first time.
func _ready():
	var textSize = text.rect_size
	area2d.get_node("CollisionShape2D").shape.extents = textSize/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isHovering and not textToImageManager.isChanging or change:
		colourVal += (1 - colourVal)/0.3 * delta
	else:
		colourVal += (0 - colourVal)/0.3 * delta
	text.set("custom_colors/font_color", Color(colour.r + (1-colour.r)*(1-colourVal), colour.g + (1-colour.g)*(1-colourVal), colour.b + (1-colour.b)*(1-colourVal)))
		
func _input(event):
	if isHovering and not textToImageManager.isChanging and Input.is_mouse_button_pressed(BUTTON_LEFT):
		blurManager.start_blur()
		change = true
		textToImageManager.isChanging = true

func change_to_image():
	image.set_texture(load(imagePath))
	text.text = ""

func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false
