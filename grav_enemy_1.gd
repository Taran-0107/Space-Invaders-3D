extends CharacterBody3D

var target

func _ready():
	target=get_node("/root/Node3D/exie")
	
func distance(a,b):
	return (a-b).length()

func in_range(radius):
	return distance(position,target.position)<radius
	
func apply_force(charracterbody,direction,magnetude):
	charracterbody.external_velocity+=direction*magnetude/direction.length()
	print("attracting",magnetude,charracterbody.velocity)
	

func _physics_process(delta):
	velocity=Vector3.ZERO
	if target==null:
		return
	if in_range(10):
		apply_force(target,position-target.position,1)

	move_and_slide()
