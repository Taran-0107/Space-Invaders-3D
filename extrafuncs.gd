extends Node


const player_bullet = preload("res://bullet.tscn")
const enemy_bullet = preload("res://enemy_bullet.tscn")




func _shoot(ship,bullet_scene,scenenode):
	
	var new_bullet = bullet_scene.instantiate()
	scenenode.add_child(new_bullet)
	new_bullet.position = ship.position + ship.transform.basis.z * 2 * -1
	new_bullet.rotation=ship.rotation
	new_bullet.basis=ship.basis
	new_bullet.velocity = ship.transform.basis.z *500*-1 + ship.velocity
	
	#print("Shot fired with velocity: ", new_bullet.velocity)
	
func player_shoot(player,scenenode):
	print("player shot")
	_shoot(player,player_bullet,scenenode)
	
func enemy_shoot(enemy,scenenode):
	print("enemy shot")
	_shoot(enemy,enemy_bullet,scenenode)
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
