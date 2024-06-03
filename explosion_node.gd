extends Node3D


var ps
var fire_ps
var core
var fs2
	
# Called when the node enters the scene tree for the first time.
func _ready():
	ps=$explosion
	fire_ps=$explosionfire
	core=$explosioncore
	fs2=$explosionfire2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset():
	ps.reset()
	fire_ps.reset()
	core.reset()
	fs2.reset()
	
func play():
	print("explosion")
	var timel=ps.lifetime
	ps.play()
	fire_ps.play()
	fs2.play()
	core.play()
	await get_tree(). create_timer(timel). timeout
	queue_free()
	
