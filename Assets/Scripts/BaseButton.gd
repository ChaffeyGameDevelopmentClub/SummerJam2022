extends Button

onready var AnimRect = $AnimRect
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_mouse_entered():
	AnimRect.hovered = true

func _on_mouse_exited():
	AnimRect.hovered = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
