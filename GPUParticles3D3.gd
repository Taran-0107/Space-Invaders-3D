extends GPUParticles3D

var ship


func _ready():
	# Set the new linear velocity
	ship=get_parent()


func _process(delta):
	process_material.initial_velocity_min=ship.velocity.length()*0.1
	process_material.initial_velocity_max=ship.velocity.length()*0.1
	
	if (ship.velocity.length()<10):
		amount=int(ship.velocity.length())*20
		
	

