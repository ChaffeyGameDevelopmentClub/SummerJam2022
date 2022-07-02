extends ColorRect

var self_color = Color.lightpink
var target_color = self_color
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self_color = self_color.linear_interpolate(target_color, 0.07)
	set_frame_color(self_color)
