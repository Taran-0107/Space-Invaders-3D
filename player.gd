extends RigidBody3D

var mouse_sensitivity=0.001
var twist_input=0
var pitch_input=0

var jumping=false

@onready var twist_pivot:=$rotpivot
@onready var pitch_pivot:=$rotpivot/twistpivot
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input=Vector3.ZERO
	input.x=Input.get_axis("move_left","move_right")
	input.z=Input.get_axis("move_fwd","move_bck")
	if Input.is_action_pressed("jump") and not jumping:
		input.y=Input.get_action_strength("jump")*10
		jumping=true
	
	if not Input.is_action_pressed("jump"):
		jumping=false
		
	apply_central_force(twist_pivot.basis*input*1200*delta)
	
	print(twist_pivot.basis)
	
	if(Input.is_action_pressed("ui_cancel")):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x=clamp(pitch_pivot.rotation.x,-0.5,0.5)
	
	twist_input=0
	pitch_input=0
	

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
			twist_input=-event.relative.x*mouse_sensitivity
			pitch_input=-event.relative.y*mouse_sensitivity
