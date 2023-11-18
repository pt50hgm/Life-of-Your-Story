# SPDX-License-Identifier: MIT

extends Node

var isTransitioning = false

var levelNum = 0
var levels = [
	"""
	preload("res://Scenes/Levels/Start.tscn"),
	preload("res://Scenes/Levels/Level1.tscn"),
	preload("res://Scenes/Levels/Level2.tscn"),
	preload("res://Scenes/Levels/Level3.tscn"),
	preload("res://Scenes/Levels/Level4.tscn"),
	preload("res://Scenes/Levels/Level5.tscn"),
	preload("res://Scenes/Levels/Level6.tscn"),
	preload("res://Scenes/Levels/Level7.tscn"),
	preload("res://Scenes/Levels/Level8.tscn"),
	preload("res://Scenes/Levels/Level9.tscn"),
	preload("res://Scenes/Levels/Level10.tscn"),
	preload("res://Scenes/Levels/Level11.tscn"),
	preload("res://Scenes/Levels/Level12.tscn"),
	preload("res://Scenes/Levels/Level13.tscn"),
	preload("res://Scenes/Levels/Level14.tscn"),
	preload("res://Scenes/Levels/Level15.tscn"),
	preload("res://Scenes/Levels/Finish.tscn"),
	"""
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# End the current level and start a new one. It may be the same level in the
# case of a reset, or the next one if the player finishes the current one.
func StartLevel():
	self.remove_child($Level)
	self.add_child(levels[levelNum].instance())
	isTransitioning = false

func StartNextLevel(num):
	levelNum = num
	SceneTransition.TransitionWhite()
	isTransitioning = true
