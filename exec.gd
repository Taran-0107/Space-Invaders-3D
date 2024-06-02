extends CharacterBody3D

var shooter=preload("res://extrafuncs.gd").new()
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
var nitros
var area
var health

func append_nitros(val):
		for i in nitros:
			i.emitting=val
			
func _ready():
	health=100
	nitros=[$particlehandler/GPUParticles3D4,$particlehandler/GPUParticles3D3]
	area=$Area3D
	
func get_input(delta):
	
	pitch_input = Input.get_axis("pitch_down", "pitch_up")
	roll_input = Input.get_axis("roll_right", "roll_left")
	yaw_input = Input.get_axis("yaw_right", "yaw_left")

	if Input.is_action_pressed("throttle_up"):
		forward_speed = lerp(forward_speed, max_speed, acceleration * delta)
	if Input.is_action_pressed("throttle_down"):
		forward_speed = lerp(forward_speed, 0.0, acceleration * delta)
		
	#print(roll_input)
func health_handler():
	health-=1
func _physics_process(delta):
	var x=get_parent().transform.basis.x
	var y=get_parent().transform.basis.y
	var z=get_parent().transform.basis.z
	var direction=transform.basis.z
	
	if Input.is_action_just_pressed("shoot"):
		shooter.player_shoot(get_node("."),get_parent())
	
	if forward_speed<=1:
		append_nitros(false)
	else:
		append_nitros(true)

	# Add the gravity.
	get_input(delta)
	velocity = -transform.basis.z * forward_speed
	
	rotation.z+=roll_input*delta*2
	
	move_and_collide(velocity * delta)
	
	
	
	


