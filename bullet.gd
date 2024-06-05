extends CharacterBody3D
#bullet hello hello
var playership
var lifetime=2
var exising=0
var area
var node3D
const damage=10
# Called when the node enters the scene tree for the first time.
func _ready():
	node3D=get_node("/root/Node3D")
	area=$Area3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	exising+=delta
	if(lifetime<exising):
		queue_free()
	
	var collision_areas=area.get_overlapping_areas()
	if(collision_areas!=[]):
		for i in node3D.enemies:
			for j in collision_areas:
				if j.get_parent()==i:
					i.health_handler(damage)
					#i.take_damage(10)
					queue_free()
		
		
		
	
	pass
