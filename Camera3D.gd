extends Camera3D

var ship
var offset
var pos_offset

@export var lerp_speed=0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	offset=rotation
	
	ship=$".."
	
	
	pos_offset=position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#position=ship.position+ship.transform.basis.z*5+ship.transform.basis.y*2
	position=lerp(position,ship.position+ship.transform.basis.y*2.3*-1,20*delta)
	rotation.x = lerp_angle(rotation.x,ship.rotation.x,delta)
	rotation.y = lerp_angle(rotation.y,ship.rotation.y,delta)
	rotation.z = lerp_angle(rotation.z,ship.rotation.z,delta)

	look_at(ship.global_transform.origin, Vector3.UP)
	#rotation.z=0
