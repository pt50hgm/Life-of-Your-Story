extends "res://Scripts/Text.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var readTime : int
export var thisFadeDuration : float
export var nextScene : String
export var changeScenes : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	fadeDuration = thisFadeDuration

func _process(delta):
	if changeScenes:
		if isReady:
			sceneManager.start_next_scene(nextScene)
