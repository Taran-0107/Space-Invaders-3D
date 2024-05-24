extends Node3D

var bullet_scene = preload("res://bullet.tscn")
var ship
var bullets = []

func _ready():
	ship = $"../Executioner"
	pass

func _process(delta):
	rotation = Vector3.ZERO
	if Input.is_action_just_pressed("shoot"):
		_shoot()

func _shoot():
	var new_bullet = bullet_scene.instantiate()
	if len(bullets) > 10:
		bullets[0].queue_free()
		bullets.pop_front()
	bullets.append(new_bullet)
	add_child(new_bullet)
	
	# Ensure the bullet is a RigidBody3D and set its position and velocity
	if new_bullet is RigidBody3D:
		new_bullet.position = ship.position + ship.transform.basis.z * 10 * -1
		new_bullet.linear_velocity = ship.transform.basis.z * -10
		print("Shot fired with velocity: ", new_bullet.linear_velocity)
	else:
		print("Bullet is not a RigidBody3D")

func _physics_process(delta):
	# Optional: Debugging information
	_debug_print_bullets()

# Optional: Debugging information
func _debug_print_bullets():
	for bullet in bullets:
		if bullet is RigidBody3D:
			print("Bullet position: ", bullet.position, " velocity: ", bullet.linear_velocity)
