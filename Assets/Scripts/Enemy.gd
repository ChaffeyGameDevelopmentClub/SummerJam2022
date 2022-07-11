extends KinematicBody2D


# Declare member variables here:
var player = null
var move = Vector2.ZERO
var speed = 20

onready var anim_tree = $AnimationTree
onready var state_machine = anim_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	chase()
	
func chase():
	if player != null:
		move = position.direction_to(player.position) * speed
		anim_tree.set("parameters/walk/blend_position", move)
		anim_tree.set("parameters/idle/blend_position", move)
		state_machine.travel("walk")
	else:
		move = Vector2.ZERO

	move = move.normalized()
	move = move_and_collide(move)

func _on_Proximity_body_entered(body):
	if body != self and body.name == 'Player':
		player = body


func _on_Proximity_body_exited(body):
	if body != self and body.name == 'Player':
		player = null
		state_machine.travel("idle")
