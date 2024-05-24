extends CharacterBody3D


# Add the node as a child of the node the script is attached to.

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var max_speed = 50.0
@export var acceleration = 0.6
@export var pitch_speed = 1.5
@export var roll_speed = 1.9
@export var yaw_speed = 1.25

var pitch_input = 0.0
var roll_input = 0.0
var yaw_input = 0.0
var forward_speed = 0.0

func get_input(delta):
	pitch_input = Input.get_axis("pitch_down", "pitch_up")
	roll_input = Input.get_axis("roll_right", "roll_left")
	yaw_input = Input.get_axis("yaw_right", "yaw_left")

	if Input.is_action_pressed("throttle_up"):
		forward_speed = lerp(forward_speed, max_speed, acceleration * delta)
	if Input.is_action_pressed("throttle_down"):
		forward_speed = lerp(forward_speed, 0.0, acceleration * delta)
		
		
	transform.basis = transform.basis.rotated(transform.basis.z,
	roll_input * roll_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x,
	pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.y,
	yaw_input * yaw_speed * delta)
	transform.basis = transform.basis.orthonormalized()


func _physics_process(delta):
	# Add the gravity.
	get_input(delta)
	velocity = -transform.basis.z * forward_speed
	move_and_collide(velocity * delta)

