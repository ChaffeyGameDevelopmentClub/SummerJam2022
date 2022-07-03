extends KinematicBody2D

const VELOCITY = 500

var input_vector: Vector2 = Vector2.ZERO
var velocity_vector: Vector2 = Vector2.ZERO

onready var AimLine = $AimLine

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
#Handle miscellaneous inputs
func _input(event): 
	pass

#Process inputs
func _process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if Input.get_action_strength("ui_right"):
		$AnimatedSprite.play("right")
	elif Input.get_action_strength("ui_left"):
		$AnimatedSprite.play("left")
	elif Input.get_action_strength("ui_up"):
		$AnimatedSprite.play("up")
	elif Input.get_action_strength("ui_down"):
		$AnimatedSprite.play("down")

#Process physics
func _physics_process(delta):
	velocity_vector = input_vector * VELOCITY
	velocity_vector = move_and_slide(velocity_vector)
	var angle_to_mouse = self.position.angle_to_point(get_global_mouse_position())
	AimLine.set_rotation(angle_to_mouse + PI)
	
