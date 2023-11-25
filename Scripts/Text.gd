extends Node2D


onready var sceneManager = get_node("/root/Main/SceneManager")
var textManager = get_parent()
var fadeIn = false
var fadeDuration = 0
var isReady = false

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isReady == false:
		if fadeIn:
			modulate.a += (1.1 - modulate.a)/fadeDuration * delta
			if modulate.a > 1:
				isReady = true

func fade_in():
	fadeIn = true
	if fadeDuration == 0:
		modulate.a = 1
		isReady = true
