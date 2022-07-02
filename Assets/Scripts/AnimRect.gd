extends ColorRect

var size = 36
var speed = 65
var hovered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hovered:
		size += speed
	else:
		size -= speed
	size = clamp(size, 36, 750)
	
	set_size(Vector2(size, 100))
