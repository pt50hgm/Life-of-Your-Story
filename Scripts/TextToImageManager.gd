extends Node2D

export var nextScene : String

onready var sceneManager = get_node("/root/Main/SceneManager")
var childrenCount = 0
var isChanging = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func increment():
	isChanging = false
	childrenCount += 1
	if childrenCount >= get_child_count():
		sceneManager.start_next_scene(nextScene)
