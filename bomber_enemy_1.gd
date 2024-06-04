extends CharacterBody3D

var shooter=preload("res://extrafuncs.gd").new()

var waitforbullet=0
var target
var vizbox
const safedistance=50
var can_shoot=true
var rotationSpeed = 2;
var healthbar
var maxhealth=100
var health
var velocity_mag=8
var area

func distance(a,b):
	return (a-b).length()

func in_range(radius):
	return distance(position,target.position)<radius

func health_handler():
	health-=10
	if health<=0:
		set_visible(false)
		shooter.explosion(position,get_parent())
		queue_free()
		
		
		
	
func _ready():
	health=maxhealth
	area=$Area3D
	target=$"../exie"
	vizbox=$viznode/VisibleOnScreenNotifier3D
	healthbar = $Sprite3D/SubViewport/HealthBar
	velocity_mag=12

	
func shoot(delta):
	if waitforbullet>1:
		waitforbullet=0
		shooter.enemy_shoot(get_node("."),get_parent())
		
	waitforbullet+=delta



func _physics_process(delta):
	
	healthbar.value = health
		
	if target!=null:
		look_at(target.position)
		velocity=velocity_mag*transform.basis.z*-1
	#if(distance(target.position,position)<20):
		#velocity=4*transform.basis.z*-1
		#
	#else:
		#velocity=10*transform.basis.z*-1
	#if(target.velocity.length()>1/2):
		#velocity=7*transform.basis.z*-1
	var collision_areas=area.get_overlapping_areas()
	if(collision_areas!=[]):
		if(collision_areas[0].get_parent()==target):
			target.health_handler(30)
			shooter.explosion(position,get_parent())
			queue_free()

	
	move_and_slide()


	
