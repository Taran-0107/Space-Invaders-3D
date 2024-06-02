extends Node3D

var player_bullet = preload("res://bullet.tscn")
var enemy_bullet = preload("res://enemy_bullet.tscn")
var star_scene=preload("res://star.tscn")
var ship1

var enemies=[]
var bullets = []

var waitforbullet=0;

func _ready():
	
	#$AudioStreamPlayer.play()
	ship1 = $exie
	enemies=[$Bob,$Bob2,$Bob3]
	
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
	pass
		
	
func add_stars(ammount):
	var star=star_scene.instantiate()
	var rand_x=randi_range(100,2000)
	var rand_y=randi_range(100,2000)
	var rand_z=randi_range(100,2000)
	star.position=Vector3(rand_x,rand_y,rand_z)
	add_child(star)



func _on_timer_timeout():
	$Bob.take_damage(10)
