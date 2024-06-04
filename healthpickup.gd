extends Node3D

var playership
var lifetime=60
var exising=0
var area

var heal=30
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("healthpickuprotation")
	playership=get_node("/root/Node3D/exie")
	area=$Area3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(lifetime-exising<5):
		$AnimationPlayer.play("healthpickupfading")
	exising+=delta
	if(lifetime<exising):
		queue_free()
	
	var collision_areas=area.get_overlapping_areas()
	if(collision_areas!=[]):
		if(collision_areas[0].get_parent()==playership):
			if playership.health>playership.maxhealth-heal:
				playership.health=playership.maxhealth
			else:
				playership.health+=heal
			queue_free()
		
		
			
		
	
	pass
