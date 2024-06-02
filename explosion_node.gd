extends Node3D


var ps
var fire_ps
	
# Called when the node enters the scene tree for the first time.
func _ready():
	ps=$explosion
	fire_ps=$explosionfire
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset():
	ps.reset()
	fire_ps.reset()
	
func play():
	print("explosion")
	var timel=ps.lifetime
	ps.play()
	fire_ps.play()
	await get_tree(). create_timer(timel). timeout
	queue_free()
	
