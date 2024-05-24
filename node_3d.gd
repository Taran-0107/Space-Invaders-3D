extends Node3D

var bullet_scene = preload("res://bullet.tscn")
var star_scene=preload("res://star.tscn")
var ship
var bullets = []

func _ready():
	
	$AudioStreamPlayer.play()
	ship = $exie
	for i in range(100):
		var star_scene=preload("res://star.tscn")
		var star=star_scene.instantiate()
		var rand_x=randi_range(-200,200)
		var rand_y=randi_range(-200,200)
		var rand_z=randi_range(-200,200)
		
		
		
		star.global_position=Vector3(rand_x,rand_y,rand_z)
		add_child(star)
	
	pass

func _process(delta):
	rotation = Vector3.ZERO
	if Input.is_action_just_pressed("shoot"):
		_shoot()

	
func _shoot():
	var new_bullet = bullet_scene.instantiate()
	if len(bullets) > 10:
		bullets.pop_front()
	bullets.append(new_bullet)
	add_child(new_bullet)
	
	# Ensure the bullet is a RigidBody3D and set its position and velocity

	new_bullet.position = ship.position + ship.transform.basis.z * 7 * -1
	new_bullet.rotation=ship.rotation
	new_bullet.basis=ship.basis
	new_bullet.velocity = ship.transform.basis.z *500*-1 + ship.velocity
	print("Shot fired with velocity: ", new_bullet.velocity)
	
	var star=star_scene.instantiate()
	var rand_x=randi_range(100,2000)
	var rand_y=randi_range(100,2000)
	var rand_z=randi_range(100,2000)
	star.position=Vector3(rand_x,rand_y,rand_z)
	add_child(star)



