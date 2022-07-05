extends KinematicBody2D


# Declare member variables here. Examples:

export var SPEED: int = 20
export var MOVE_DIST: int = 40

var movement = Vector2.ZERO
var idle_direction = Vector2.ZERO

onready var start_x = position.x
onready var target_x = start_x + MOVE_DIST
onready var anim_tree = $AnimationTree
onready var state_machine = anim_tree.get("parameters/playback")


func move_to(new, to):
	if new < to:
		new = 1
		idle_direction.x = new
	elif to == start_x:
		new = -1
		idle_direction.x = new
	else:
		new = 0
	return new


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func reverse_movement():
		if target_x != start_x:
			target_x = start_x
		else:
			target_x = start_x + MOVE_DIST
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movement.x = move_to(position.x, target_x)
	anim_tree.set("parameters/walk/blend_position", idle_direction)
	anim_tree.set("parameters/idle/blend_position", idle_direction)
	state_machine.travel("walk")
	movement = move_and_slide(movement * SPEED)
	
	if position.x == target_x:
		state_machine.travel("idle")
		reverse_movement()
