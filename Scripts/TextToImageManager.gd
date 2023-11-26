extends Node2D

export var nextScene : String
export var fadeDuration : float
export var delay : float

onready var sceneManager = get_node("/root/Main/SceneManager")
var childrenCount = 0
var isChanging = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = 0
var fadeIn = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if fadeIn:
		modulate.a += (1.1 - modulate.a)/fadeDuration * delta
	elif timer > delay:
		fade_in()

func fade_in():
	fadeIn = true
	if fadeDuration == 0:
		modulate.a = 1

func increment():
	isChanging = false
	childrenCount += 1
	if childrenCount >= get_child_count():
		sceneManager.start_next_scene(nextScene)
