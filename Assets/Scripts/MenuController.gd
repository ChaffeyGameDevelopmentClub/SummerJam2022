extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# button functionality (changes scene)
func _on_PlayButton_pressed():
	get_tree().change_scene("res://Assets/Scenes/Debug.tscn")
	
func _on_ExitButton_pressed():
	get_tree().quit()





