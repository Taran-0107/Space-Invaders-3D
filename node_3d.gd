extends Node3D

var player_bullet = preload("res://bullet.tscn")
var enemy_bullet = preload("res://enemy_bullet.tscn")
var star_scene=preload("res://star.tscn")
var enemy_scene=preload("res://bob_enemy1.tscn")
var ship1

var enemies=[]
var bullets = []
var wave
var flag=true
const maxwaves=5

var waitforbullet=0;

func random_in_a_box(box_size):
		var rand_x=randi_range(-200,200)
		var rand_y=randi_range(-200,200)
		var rand_z=randi_range(-200,200)
		return Vector3(rand_x,rand_y,rand_z)
		
func spawn_object(object_scene,count,range,object_list=null):
	for i in range(count):
		var ob=object_scene.instantiate()
		ob.position=random_in_a_box(range)
		if object_list!=null:
			object_list.append(ob)
		add_child(ob)
		
func spawn_enemies(wave):
	const wl=[1,2,3,4,5]
	var count=wl[wave-1]
	spawn_object(enemy_scene,count,300,enemies)
		
		
func _ready():
	
	#$AudioStreamPlayer.play()
	wave=1
	ship1 = $exie
	enemies=[$Bob,$Bob2,$Bob3]
	add_stars(100)
	spawn_enemies(wave)
	

func _process(delta):
	
	for i in enemies:
		if i==null:
			enemies.remove_at(enemies.find(i))
	print(enemies,wave)
	
	if enemies.is_empty() and flag:
		
		await get_tree(). create_timer(5). timeout
		flag=false
		
	
	if not flag:
		wave+=1
		spawn_enemies(wave)
		flag=true
	pass
		
	
func add_stars(ammount):
	var star=star_scene.instantiate()
	var rand_x=randi_range(100,2000)
	var rand_y=randi_range(100,2000)
	var rand_z=randi_range(100,2000)
	star.position=Vector3(rand_x,rand_y,rand_z)
	add_child(star)


