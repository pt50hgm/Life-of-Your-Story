extends Node2D


var textManager = get_parent()
var fadeIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fadeIn:
		modulate.a += (1 - modulate.a)/0.5 * delta

func fade_in():
	fadeIn = true
