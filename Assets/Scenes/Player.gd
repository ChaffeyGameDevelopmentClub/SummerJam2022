extends KinematicBody2D

const VELOCITY = 500

var input_vector: Vector2 = Vector2.ZERO
var velocity_vector: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Process inputs
func _process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	print(input_vector.length())

#Process physics
func _physics_process(delta):
	velocity_vector = input_vector * VELOCITY
	velocity_vector = move_and_slide(velocity_vector)
	
