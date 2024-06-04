extends CharacterBody3D

var playership
var lifetime=2
var exising=0
var area
# Called when the node enters the scene tree for the first time.
func _ready():
	playership=get_node("/root/Node3D/exie")
	area=$Area3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	exising+=delta
	if(lifetime<exising):
		queue_free()
	
	var collision_areas=area.get_overlapping_areas()
	if(collision_areas!=[]):
		if(collision_areas[0].get_parent()==playership):
			playership.health_handler(5)
			queue_free()
		
		
			
		
	
	pass


