extends Camera3D

var ship
var offset
var twistpivot
var pitchpivot
var pos_offset
var twist_input=0
var pitch_input=0

var mouse_sensitivity=0.001

@export var lerp_speed=0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pitchpivot=get_parent()
	twistpivot=pitchpivot.get_parent()
	offset=rotation
	
	ship=get_node("/root/Node3D/exie")
	
	
	pos_offset=(ship.position-twistpivot.position)*-1
	pass # Replace with function body.a


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	#if(Input.is_action_pressed("ui_cancel")):
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#if(Input.is_action_pressed("ui_accept")):
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	if ship!=null:
	#position=ship.position+ship.transform.basis.z*5+ship.transform.basis.y*2
		twistpivot.position=lerp(twistpivot.position,(ship.position+ship.transform.basis.z*7+ship.transform.basis.y*2),delta*10)
		
		twistpivot.position.x+=twist_input*500*delta
		twistpivot.position.y+=pitch_input*500*delta
		
		twistpivot.rotate_y(twist_input*delta*100)
		pitchpivot.rotate_x(pitch_input*delta*100)
		
		pitchpivot.rotation.x=clamp(pitchpivot.rotation.x,deg_to_rad(-60),deg_to_rad(60))
		#twistpivot.rotation.y=clamp(twistpivot.rotation.y,deg_to_rad(0),deg_to_rad(360))
		
		ship.rotation.x=lerp_angle(ship.rotation.x,pitchpivot.rotation.x,delta*8) 
		ship.rotation.y=lerp_angle(ship.rotation.y,twistpivot.rotation.y,delta*8) 

		twist_input=0
		pitch_input=0
		
	
	
	

	#look_at(ship.global_transform.origin+ship.global_transform.basis.y*4, Vector3.UP)
	#rotation.z=0

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
			twist_input=-event.relative.x*mouse_sensitivity
			pitch_input=-event.relative.y*mouse_sensitivity
			
	if event.is_action_pressed("ui_cancel"):
		$"../../../PauseMenu".pause()
			
		
