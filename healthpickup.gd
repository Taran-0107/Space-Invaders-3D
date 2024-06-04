extends Node3D

var playership
var lifetime=10
var exising=0
var area
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("healthpickuprotation")
	playership=get_node("/root/Node3D/exie")
	area=$Area3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(lifetime-exising<lifetime/2):
		$AnimationPlayer.play("healthpickupfading")
	exising+=delta
	if(lifetime<exising):
		queue_free()
	
	var collision_areas=area.get_overlapping_areas()
	if(collision_areas!=[]):
		if(collision_areas[0].get_parent()==playership):
			playership.health+=30
			queue_free()
		
		
			
		
	
	pass
