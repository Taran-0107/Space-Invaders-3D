extends Label

var node3D
var scoretextlabel
# Called when the node enters the scene tree for the first time.
func _ready():
	scoretextlabel=$Label
	node3D=get_node("/root/Node3D")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scoretextlabel.text=str(node3D.score)
	pass
