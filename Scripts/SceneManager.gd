extends Node

var isTransitioning = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# End the current level and start a new one. It may be the same level in the
# case of a reset, or the next one if the player finishes the current one.
func StartLevel(nextScene):
	self.remove_child($Scene)
	self.add_child(load(nextScene).instance())
	isTransitioning = false

func start_next_scene(nextScene):
	SceneTransition.TransitionBlack(nextScene)
	isTransitioning = true
