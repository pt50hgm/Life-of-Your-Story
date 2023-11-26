extends AudioStreamPlayer

var soundTrack = [
	preload("res://Sounds/louise.mp3"),
	preload("res://Sounds/change.mp3"),
	preload("res://Sounds/revelation.mp3")
]
var trackIndex = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_volume_db(-25)

func _process(delta):
	if not self.is_playing() and trackIndex >= 0:
		self.stream = soundTrack[trackIndex]
		self.play()

func change_tracks(index):
	trackIndex = index
