extends Node3D

@onready var twistpivot = $twistpivot

var rotation_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if twistpivot.rotation_degrees.y >= 43:
		##twistpivot.rotation_degrees.y -= delta * rotation_speed
		#rotation_speed= -rotation_speed
	#elif twistpivot.rotation_degrees.y <= -43:
		##twistpivot.rotation_degrees.y += delta * rotation_speed
		#rotation_speed = -rotation_speed
		
	twistpivot.rotation_degrees.y += delta * rotation_speed
		
		
	#print(twistpivot.rotation_degrees.y)
