extends AnimatedSprite

export var facingRight : bool

var released = false
var isWalking = false
var targetX = 0
var speed = 1.75
var dX = [10, 10, 13, 13, 10, 10, 7, 10, 10, 13, 13, 10, 10, 7]
var frameMove = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Input.is_mouse_button_pressed(1):
		released = true
	else:
		released = false
	
	if isWalking and frameMove != frame:
		frameMove = frame
		if facingRight:
			position.x += dX[frame] * speed
		else:
			position.x -= dX[frame] * speed
		if abs(position.x - targetX) <= speed * 20:
			isWalking = false
			animation = "Idle"


func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and released and get_parent().canWalk:
		var mousePos = get_global_mouse_position()
		
		isWalking = true
		targetX = mousePos.x
		
		facingRight = targetX >= position.x
		set_flip_h(not facingRight)
		animation = "Walk"
