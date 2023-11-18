extends CanvasLayer

onready var sceneManager = get_node("/root/Main/SceneManager")

func TransitionBlack():
	$AnimationPlayer.play("DissolveBlack")
	yield($AnimationPlayer, "animation_finished")
	sceneManager.StartLevel()
	$AnimationPlayer.play_backwards("DissolveBlack")

func TransitionWhite():
	$AnimationPlayer.play("DissolveWhite")
	yield($AnimationPlayer, "animation_finished")
	sceneManager.StartLevel()
	$AnimationPlayer.play_backwards("DissolveWhite")
