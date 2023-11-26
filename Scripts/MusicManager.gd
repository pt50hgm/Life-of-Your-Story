extends Node

export var index : int
onready var soundTrackPlayer = get_node("/root/Main/SoundTrackPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	soundTrackPlayer.change_tracks(index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
