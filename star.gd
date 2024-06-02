extends RigidBody3D

var ship
# Called when the node enters the scene tree for the first time.

func distance(a,b):
	return (a-b).length()

func _ready():
	ship=get_node("/root/Node3D/exie")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if(distance(ship.position,position)>200):
		pass
	pass
