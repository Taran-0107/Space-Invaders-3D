extends VBoxContainer

const NODE_3D = preload("res://node_3d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_pressed():
	get_tree().change_scene_to_packed(NODE_3D)
	print(get_tree())


func _on_exit_pressed():
	get_tree().quit()
	print(get_tree())
