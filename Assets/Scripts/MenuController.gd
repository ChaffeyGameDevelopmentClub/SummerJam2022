extends Node

onready var BG = $BG
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# button functionality (changes scene)
func _on_PlayButton_pressed():
	get_tree().change_scene("res://Assets/Scenes/Stages/Stages/TestStage_Battle.tscn")
	
#Launch Multiplayer Menu
func _on_MultiplayerButton_pressed():
	get_tree().change_scene("res://Assets/Scenes/Multiplayer/lobby.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()

# color changes in bg
func _on_play_button_mouse_entered():
	BG.target_color = Color.lightpink

func _on_mult_button_mouse_entered():
	BG.target_color = Color.aqua

func _on_settings_button_mouse_entered():
	BG.target_color = Color.mediumspringgreen

func _on_credits_button_mouse_entered():
	BG.target_color = Color.slateblue

func _on_exit_button_mouse_entered():
	BG.target_color = Color.darkkhaki
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




