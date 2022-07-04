extends KinematicBody2D

const VELOCITY = 100

var input_vector: Vector2 = Vector2.ZERO
var velocity_vector: Vector2 = Vector2.ZERO

onready var AimLine = $AimLine
onready var animation_tree = $AnimationTree
onready var animation_player = $AnimationPlayer
onready var animation_state = animation_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.playback_speed = 2
	
#Handle miscellaneous inputs
func _input(event): 
	pass

#Process inputs
func _process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Walk/blend_position", input_vector)
		animation_state.travel("Walk")
	else:
		animation_state.travel("Idle")
	

#Process physics
func _physics_process(delta):
	velocity_vector = input_vector * VELOCITY
	velocity_vector = move_and_slide(velocity_vector)
	var angle_to_mouse = self.position.angle_to_point(get_global_mouse_position())
	AimLine.set_rotation(angle_to_mouse + PI)	
