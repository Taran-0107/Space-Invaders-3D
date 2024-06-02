extends CharacterBody3D




var shooter=preload("res://extrafuncs.gd").new()

var waitforbullet=0
var target
var vizbox
const safedistance=50
var can_shoot=true
var rotationSpeed = 2;
var healthbar

var health
var velocity_mag=8

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
	health=100
	target=$"../exie"
	vizbox=$viznode/VisibleOnScreenNotifier3D
	healthbar = $SubViewport/HealthBar

	
func shoot(delta):
	if waitforbullet>1:
		waitforbullet=0
		shooter.enemy_shoot(get_node("."),get_parent())
		
	waitforbullet+=delta



func _physics_process(delta):
	
	healthbar.value = health
	
	
	if can_shoot:
		shoot(delta)

	if vizbox.is_on_screen():
		var timetocatch=(distance(target.position,position))/target.velocity.length()
		if timetocatch<1:
			can_shoot=false
			look_at(position+(position-target.position))
			velocity=target.velocity.length()*transform.basis.z*-1*0.9
		else:
			look_at(target.position)
			velocity=Vector3.ZERO
	else:
		can_shoot=true
		look_at(target.position)
		
		if in_range(50):
			velocity=Vector3.ZERO
			
		else:
			velocity=velocity_mag*transform.basis.z*-1
	#if(distance(target.position,position)<20):
		#velocity=4*transform.basis.z*-1
		#
	#else:
		#velocity=10*transform.basis.z*-1
	#if(target.velocity.length()>1/2):
		#velocity=7*transform.basis.z*-1

	
	move_and_slide()


#func take_damage(damage):
	#if healthbar.value < damage:
		#damage = healthbar.value
	#healthbar.value -= damage
	
	
