extends CharacterBody3D


var lifetime=2
var exising=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	exising+=delta
	if(lifetime<exising):
		queue_free()
	
	pass
